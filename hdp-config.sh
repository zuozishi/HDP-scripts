#! /bin/bash

function echo-log
{
    echo -e "\033[32m$1\033[0m"
}

hostssh="Administrator@192.168.1.2"
prefix=24
netseg="192.168.1"
gateway="$netseg.1"
ip_master="$netseg.10"
ip_slave1="$netseg.11"
ip_slave2="$netseg.12"
ip_slave3="$netseg.13"
dns1="114.114.114.114"
dns2="114.114.115.115"

hostname1=$(whiptail --title "Setup" --menu "Choose deploy type." 15 60 4 \
"master" "" \
"slave1" "" \
"slave2" "" \
"slave3" ""  3>&1 1>&2 2>&3)
clear

echo-log "Depoly as $hostname1"
if ([ $hostname1 == "master" ]) then
    ipaddr=$ip_master
fi
if ([ $hostname1 == "slave1" ]) then
    ipaddr=$ip_slave1
fi
if ([ $hostname1 == "slave2" ]) then
    ipaddr=$ip_slave2
fi
if ([ $hostname1 == "slave3" ]) then
    ipaddr=$ip_slave3
fi

function aliyun-yum
{
    mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
    wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
    yum makecache
}

function config-hostname
{
    hostnamectl set-hostname $hostname1
    echo "NETWORKING=yes" >> /etc/sysconfig/network
    echo "HOSTNAME=$hostname1" >> /etc/sysconfig/network
}

function config-ipaddr
{
    ls /etc/sysconfig/network-scripts/ | grep ifcfg-
    read -p "Please network interface: " netinterface
    netfile="/etc/sysconfig/network-scripts/ifcfg-$netinterface"
    uuid=$(uuidgen ens33)

    cp ./ifcfg-ens33.txt $netfile
    echo "DEVICE=\"$netinterface\"" >> $netfile
    echo "NAME=\"$netinterface\"" >> $netfile
    echo "UUID=\"$uuid\"" >> $netfile
    echo "IPADDR=\"$ipaddr\"" >> $netfile
    echo "PREFIX=\"$prefix\"" >> $netfile
    echo "GATEWAY=\"$gateway\"" >> $netfile
    echo "DNS1=\"$dns1\"" >> $netfile
    echo "DNS2=\"$dns2\"" >> $netfile
    service network restart
}

function config-hosts
{
    echo "127.0.0.1 localhost" > /etc/hosts
    echo "::1 localhost" >> /etc/hosts
    echo "$ip_master master master.root" >> /etc/hosts
    echo "$ip_slave1 slave1 slave1.root" >> /etc/hosts
    echo "$ip_slave2 slave2 slave2.root" >> /etc/hosts
    echo "$ip_slave3 slave3 slave3.root" >> /etc/hosts
}

function config-time
{
    nowdate=$(date)
    if (whiptail --title "Change Time Zone ?" --yesno "$nowdate" 10 60) then
        tzselect
    fi
    clear
    yum install ntp -y
    if [[ $(hostname) == "master" ]]
    then
        echo-log "Config master ntp service..."
        echo "disable monitor" > /etc/ntp.conf
        echo "server $netseg.0" >> /etc/ntp.conf
        echo "fudge $netseg.0 stratum 10" >> /etc/ntp.conf
        systemctl restart ntpd.service
    else
        echo-log "Sync slave time to master..."
        ntpdate master
    fi
}

function config-ssh
{
    ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
    cp ~/.ssh/id_dsa.pub ~/.ssh/$(hostname)-ssh.pub
    #scp ~/.ssh/$(hostname)-ssh.pub $hostssh:C:
}

if ([ -e $(cat ~/.bashrc | grep cls) ]) then
    echo "alias cls='clear'" >> ~/.bashrc
    export alias cls='clear'
    source ~/.bashrc
fi

ConfigList=$(whiptail --title "Config List" --checklist \
"Choose config items" 15 60 8 \
"disfirewall" "Disable Firewalld" ON \
"aliyun-yum" "Aliyun yum source" OFF \
"hostname" "New Hostname" ON \
"ipaddr" "Config IP Address" ON \
"hosts" "Config Hosts File" ON \
"ssh" "Config SSH Server" ON \
"time" "Config Time Sync" ON 3>&1 1>&2 2>&3)

clear

if [[ $ConfigList == *"disfirewall"* ]]
then
    echo-log "stop firewalld..."
    systemctl stop firewalld
    echo-log "disable firewalld..."
    systemctl disable firewalld
fi

if [[ $ConfigList == *"aliyun-yum"* ]]
then
    echo-log "Config aliyun yum source..."
    aliyun-yum
fi

if [[ $ConfigList == *"hostname"* ]]
then
    echo-log "Config new hostname..."
    config-hostname
fi

if [[ $ConfigList == *"ipaddr"* ]]
then
    echo-log "Config static ip address..."
    config-ipaddr
fi

if [[ $ConfigList == *"hosts"* ]]
then
    echo-log "Config hosts file..."
    config-hosts
fi

if [[ $ConfigList == *"ssh"* ]]
then
    config-ssh
fi

if [[ $ConfigList == *"time"* ]]
then
    config-time
fi