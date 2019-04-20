#! /bin/bash

function echo-log
{
    echo -e "\033[47;34m $1 \033[0m"
    echo "-------------"
}

#建立日志文件夹
if ( test -d ./log )
then
    ls ./log
else
    mkdir ./log
fi

HOST_NAME=$1

echo-log "Stop and Disable firewalld on $HOST_NAME"
systemctl stop firewalld
systemctl disable firewalld

echo-log "hostname -> $HOST_NAME"
hostname $HOST_NAME
echo $HOST_NAME > /etc/hostname

echo-log "ssh-keygen on $HOST_NAME"
if ( test -d ~/.ssh/id_rsa )
then
    rm -f ~/.ssh/id_rsa
fi
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa > ./log/ssh_key.log

nowdate=$(date)
if (whiptail --title "Change Time Zone ?" --yesno "$nowdate" 10 60) then
    tzselect
fi
clear
which ntpdate
if [[ $? == 0 ]]
then
    echo-log 'NTP has installed'
else
    if (whiptail --title "yum install ntp ?" --yesno "" 10 60) then
        echo-log 'Install NTP...'
        yum install ntp -y >> ./log/ntp.log
    fi
fi

which ntpdate
if [[ $? == 0 ]]
then
    echo-log 'Sync time from master...'
    ntpdate master >> ./log/ntp.log &
fi

#解压所有软件包
for tar in /opt/soft/*.tar.gz
do
    echo-log "unzip $tar..."
    tar xvf $tar -C /usr >> ./log/tar.log
done

for tar in /opt/soft/*.tgz
do
    echo-log "unzip $tar..."
    tar xvf $tar -C /usr >> ./log/tar.log
done

#移动软件目录
mv /usr/jdk1.* /usr/java
mv /usr/zookeeper-* /usr/zookeeper
mv /usr/hadoop-* /usr/hadoop
mv /usr/scala-* /usr/scala
mv /usr/spark-* /usr/spark

mkdir /usr/zookeeper/zkdata
mkdir /usr/zookeeper/zkdatalog

for tar in /opt/soft/*.gz ;do tar -vxzf $tar -C /usr ; done