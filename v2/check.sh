#! /bin/bash

function log-check
{
    if [ $? -eq 0 ]; then
        echo -e "\033[44;30m $1 [Success] \033[0m"
    else
        echo -e "\033[41;30m $1 [Error] \033[0m"
    fi
    echo "-------------"
}

function check-common
{
#防火墙
    systemctl status firewalld | grep inactive > /dev/null
    log-check "Firewalld"

#/etc/hosts
    cat /etc/hosts | grep master > /dev/null
    log-check "Hosts - master"

    cat /etc/hosts | grep slave1 > /dev/null
    log-check "Hosts - slave1"

    cat /etc/hosts | grep slave2 > /dev/null
    log-check "Hosts - slave2"

#SSH Key
    cat ~/.ssh/authorized_keys | grep root@master > /dev/null
    log-check "SSH Key - master"
    cat ~/.ssh/authorized_keys | grep root@slave1 > /dev/null
    log-check "SSH Key - slave1"
    cat ~/.ssh/authorized_keys | grep root@slave2 > /dev/null
    log-check "SSH Key - slave2"

    ssh master hostname | grep master > /dev/null
    log-check "SSH Test - master"
    ssh slave1 hostname | grep slave1 > /dev/null
    log-check "SSH Test - slave1"
    ssh slave2 hostname | grep slave2 > /dev/null
    log-check "SSH Test - slave2"

#Programs
    test $(which ntpdate)
    log-check "Program - NTP"

    test $(which jps)
    log-check "Program - Java"

    test $(which hadoop)
    log-check "Program - Hadoop"

    test $(which zkServer.sh)
    log-check "Program - Zookeeper"

    test $(which scala)
    log-check "Program - Scala"

    test $(which spark-shell)
    log-check "Program - Spark"
}

function check-master
{
#NTP服务
    netstat -ano | grep 123 > /dev/null
    log-check "NTP - Service"

#JPS进程
    jps | grep Master > /dev/null
    log-check "NTP - Master"

    jps | grep QuorumPeerMain > /dev/null
    log-check "Jps - QuorumPeerMain"

    jps | grep NameNode > /dev/null
    log-check "Jps - NameNode"

    jps | grep ResourceManager > /dev/null
    log-check "Jps - ResourceManager"
}

function check-slave
{
#JPS进程
    jps | grep Worker > /dev/null
    log-check "Jps - Worker"

    jps | grep DataNode > /dev/null
    log-check "Jps - DataNode"

    jps | grep NodeManager > /dev/null
    log-check "Jps - NodeManager"

    jps | grep QuorumPeerMain > /dev/null
    log-check "Jps - QuorumPeerMain"
}

echo -e "\033[46;30m ---------------------- \033[0m"
echo -e "\033[46;30m |    Check $(hostname)    | \033[0m"
echo -e "\033[46;30m ---------------------- \033[0m"
source /etc/profile
check-common

if ([ $(hostname) == "master" ])
then
    check-master
    if (whiptail --title "Check Salves ?" --yesno "Check Salves ?" 10 60) then
        scp ./check.sh slave1:~/check.sh
        ssh slave1 "./check.sh"
        scp ./check.sh slave2:~/check.sh
        ssh slave2 "./check.sh"
    fi
else
    check-slave
fi