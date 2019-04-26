#! /bin/bash

function echo-log
{
    echo -e "\033[46;30m $1 \033[0m"
    echo "-------------"
}

#配置
NETWORK_ENABLE=1
IP_MASTER="192.168.1.201"
IP_SLAVE1="192.168.1.202"
IP_SLAVE2="192.168.1.203"
SSHKEY_SLAVE1="123123"
SSHKEY_SLAVE2="123123"

echo-log "NETWORK_ENABLE=$NETWORK_ENABLE"
echo-log "IP_MASTER=\"$IP_MASTER\""
echo-log "IP_SLAVE1=\"$IP_SLAVE1\""
echo-log "IP_SLAVE2=\"$IP_SLAVE2\""

echo-log "SSHKEY_SLAVE1=\"$SSHKEY_SLAVE1\""
echo-log "SSHKEY_SLAVE2=\"$SSHKEY_SLAVE2\""
read -p "Press any key to contiune..."
echo "-------------"

starttime=`date +'%Y-%m-%d %H:%M:%S'`
#建立日志文件夹
if ( test -d ./log )
then
    ls ./log
else
    mkdir ./log
fi

test -e ./sshpass
if [ $? -eq 0 ]; then
    ./sshpass | grep password > /dev/null
    if [ $? -eq 0 ]; then
        echo-log "sshpass Enable"
    else
        rm -f ./sshpass
        echo-log "sshpass Disable"
    fi
else
    echo-log "sshpass Disable"
fi

#关闭防火墙
echo-log "Stop and Disable firewalld"
systemctl stop firewalld
systemctl disable firewalld

#设置主机名
echo-log "hostname -> master"
hostname master
echo master > /etc/hostname

#配置IP和Hosts
echo-log "Build /etc/hosts"
echo "127.0.0.1 localhost localhost.localdomain localhost4 localhost4.localdomain4" > /etc/hosts
echo "::1 localhost localhost.localdomain localhost6 localhost6.localdomain6" >> /etc/hosts
echo "$IP_MASTER master" >> /etc/hosts
echo "$IP_SLAVE1 slave1" >> /etc/hosts
echo "$IP_SLAVE2 slave2" >> /etc/hosts

#时间同步
if [ $NETWORK_ENABLE -eq 1 ]
then
    if ( which ntpdate );then echo-log 'NTP has installed';else echo-log 'Install NTP...';yum install ntp -y >> ./log/ntp.log;fi
    ntpdate ntp1.aliyun.com
fi

if ( which ntpdate )
then
    echo "disable monitor" > /etc/ntp.conf
    echo "server 127.127.1.0" >> /etc/ntp.conf
    echo "fudge 127.127.1.0 stratum 10" >> /etc/ntp.conf
    systemctl restart ntpd.service
fi

#解压所有软件包
for tar in /opt/soft/*.{gz,tgz}
do
    (tar zxf $tar -C /usr >> ./log/tar.log; echo-log "$tar done") &
done

chmod 777 sshpass
if ( test -e ./sshpass ); then
    echo 123 > /dev/null
else
    wait
fi

#配置Slaves
chmod 777 *.sh
echo-log "Configure slave1"
if ( test -e ./sshpass ); then
    ./sshpass -p "$SSHKEY_SLAVE1" scp -o StrictHostKeyChecking=no slave.sh slave1:~/slave.sh
    ./sshpass -p "$SSHKEY_SLAVE1" ssh -o StrictHostKeyChecking=no slave1 "./slave.sh slave1" &
    echo-log "Configure slave2"
    ./sshpass -p "$SSHKEY_SLAVE2" scp -o StrictHostKeyChecking=no slave.sh slave2:~/slave.sh
    ./sshpass -p "$SSHKEY_SLAVE2" ssh -o StrictHostKeyChecking=no slave2 "./slave.sh slave2" &
else
    scp -o StrictHostKeyChecking=no slave.sh slave1:~/slave.sh
    ssh -o StrictHostKeyChecking=no slave1 "./slave.sh slave1"
    echo-log "Configure slave2"
    scp -o StrictHostKeyChecking=no slave.sh slave2:~/slave.sh
    ssh -o StrictHostKeyChecking=no slave2 "./slave.sh slave2"
fi
wait

#SSH免密登录
echo-log "SSH public key"
if ( test -d ~/.ssh/id_rsa )
then
    rm -f ~/.ssh/id_rsa
fi
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa > ./log/ssh_key.log
if ( test -e ./sshpass )
then
    ./sshpass -p "$SSHKEY_SLAVE1" scp -o StrictHostKeyChecking=no slave1:~/.ssh/id_rsa.pub ~/.ssh/slave1
    ./sshpass -p "$SSHKEY_SLAVE2" scp -o StrictHostKeyChecking=no slave2:~/.ssh/id_rsa.pub ~/.ssh/slave2
else
    scp slave1:~/.ssh/id_rsa.pub ~/.ssh/slave1
    scp slave2:~/.ssh/id_rsa.pub ~/.ssh/slave2
fi
cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys
cat ~/.ssh/slave1 >> ~/.ssh/authorized_keys
cat ~/.ssh/slave2 >> ~/.ssh/authorized_keys

if ( test -e ./sshpass ); then
    ./sshpass -p "$SSHKEY_SLAVE1" scp -o StrictHostKeyChecking=no ~/.ssh/authorized_keys slave1:~/.ssh/authorized_keys
    ./sshpass -p "$SSHKEY_SLAVE2" scp -o StrictHostKeyChecking=no ~/.ssh/authorized_keys slave2:~/.ssh/authorized_keys
else
    scp ~/.ssh/authorized_keys slave1:~/.ssh/authorized_keys
    scp ~/.ssh/authorized_keys slave2:~/.ssh/authorized_keys
fi

#移动软件目录
mv /usr/jdk1.* /usr/java
mv /usr/zookeeper-* /usr/zookeeper
mv /usr/hadoop-* /usr/hadoop
mv /usr/scala-* /usr/scala
mv /usr/spark-* /usr/spark

#复制Hadoop配置文件
echo-log 'Copy hadoop conf files.'
hdpcfg=/usr/hadoop/etc/hadoop
cp ./conf/core-site.xml $hdpcfg/core-site.xml
cp ./conf/hdfs-site.xml $hdpcfg/hdfs-site.xml
cp ./conf/yarn-site.xml $hdpcfg/yarn-site.xml
cp ./conf/mapred-site.xml $hdpcfg/mapred-site.xml
echo "export JAVA_HOME=/usr/java" >> $hdpcfg/hadoop-env.sh
echo "master" > $hdpcfg/master
echo "slave1" > $hdpcfg/slaves
echo "slave2" >> $hdpcfg/slaves

#生成Zookeeper配置文件
echo-log 'Configure zookeeper.'
zoocfg="/usr/zookeeper/conf/zoo.cfg"
echo "tickTime=2000" > $zoocfg
echo "initLimit=10" >> $zoocfg
echo "syncLimit=5" >> $zoocfg
echo "dataDir=/usr/zookeeper/zkdata" >> $zoocfg
echo "clientPort=2181" >> $zoocfg
echo "dataLogDir=/usr/zookeeper/zkdatalog" >> $zoocfg
echo "server.1=master:2888:3888" >> $zoocfg
echo "server.2=slave1:2888:3888" >> $zoocfg
echo "server.3=slave2:2888:3888" >> $zoocfg
mkdir /usr/zookeeper/zkdata
mkdir /usr/zookeeper/zkdatalog
echo "1" > /usr/zookeeper/zkdata/myid
echo "2" > /usr/zookeeper/zkdata/id2
echo "3" > /usr/zookeeper/zkdata/id3

#生成Spark配置文件
echo-log 'Configure Spark.'
echo "export SPARK_MASTER_IP=master" > /usr/spark/conf/spark-env.sh
echo "export SCALA_HOME=/usr/scala" >> /usr/spark/conf/spark-env.sh
echo "export SPARK_WORKER_MEMORY=8g" >> /usr/spark/conf/spark-env.sh
echo "export JAVA_HOME=/usr/java" >> /usr/spark/conf/spark-env.sh
echo "export HADOOP_HOME=/usr/hadoop" >> /usr/spark/conf/spark-env.sh
echo "export HADOOP_CONF_DIR=/usr/hadoop/etc/hadoop" >> /usr/spark/conf/spark-env.sh
echo "slave1" > /usr/spark/conf/slaves
echo "slave2" >> /usr/spark/conf/slaves

#发布Hosts
echo-log "Send /etc/hosts"
scp /etc/hosts slave1:/etc/hosts
scp /etc/hosts slave2:/etc/hosts

#发布配置文件
echo-log 'Configure file -> slave1'
scp ./conf/core-site.xml slave1:$hdpcfg/core-site.xml
scp ./conf/hdfs-site.xml slave1:$hdpcfg/hdfs-site.xml
scp ./conf/yarn-site.xml slave1:$hdpcfg/yarn-site.xml
scp $hdpcfg/hadoop-env.sh slave1:$hdpcfg/hadoop-env.sh
scp $hdpcfg/mapred-site.xml slave1:$hdpcfg/mapred-site.xml
scp $hdpcfg/master slave1:$hdpcfg/master
scp $hdpcfg/slaves slave1:$hdpcfg/slaves
scp /usr/spark/conf/spark-env.sh slave1:/usr/spark/conf/spark-env.sh
scp /usr/spark/conf/slaves slave1:/usr/spark/conf/slaves
scp $zoocfg slave1:$zoocfg
scp /usr/zookeeper/zkdata/id2 slave1:/usr/zookeeper/zkdata/myid

echo-log 'Configure file -> slave2'
scp ./conf/core-site.xml slave2:$hdpcfg/core-site.xml
scp ./conf/hdfs-site.xml slave2:$hdpcfg/hdfs-site.xml
scp ./conf/yarn-site.xml slave2:$hdpcfg/yarn-site.xml
scp $hdpcfg/hadoop-env.sh slave2:$hdpcfg/hadoop-env.sh
scp $hdpcfg/mapred-site.xml slave2:$hdpcfg/mapred-site.xml
scp $hdpcfg/master slave2:$hdpcfg/master
scp $hdpcfg/slaves slave2:$hdpcfg/slaves
scp /usr/spark/conf/spark-env.sh slave2:/usr/spark/conf/spark-env.sh
scp /usr/spark/conf/slaves slave2:/usr/spark/conf/slaves
scp $zoocfg slave2:$zoocfg
scp /usr/zookeeper/zkdata/id3 slave2:/usr/zookeeper/zkdata/myid

echo-log 'Configure /etc/profile'
echo -e "\n\
export JAVA_HOME=/usr/java\n\
export ZOOKEEPER_HOME=/usr/zookeeper\n\
export HADOOP_HOME=/usr/hadoop\n\
export SCALA_HOME=/usr/scala\n\
export SPARK_HOME=/usr/spark\n\
export PATH=\$PATH:\$JAVA_HOME/bin:\$ZOOKEEPER_HOME/bin:\$HADOOP_HOME/bin:\$HADOOP_HOME/sbin:\$SCALA_HOME/bin:\$SPARK_HOME/bin\n" >> /etc/profile
source /etc/profile
scp /etc/profile slave1:/etc/profile
scp /etc/profile slave2:/etc/profile

# Known Hosts
echo-log "Build known_hosts"
ssh -o StrictHostKeyChecking=no master hostname > /dev/null
ssh -o StrictHostKeyChecking=no slave1 "ssh -o StrictHostKeyChecking=no master hostname" > /dev/null
ssh -o StrictHostKeyChecking=no slave1 "ssh -o StrictHostKeyChecking=no slave1 hostname" > /dev/null
ssh -o StrictHostKeyChecking=no slave1 "ssh -o StrictHostKeyChecking=no slave2 hostname" > /dev/null
ssh -o StrictHostKeyChecking=no slave2 "ssh -o StrictHostKeyChecking=no master hostname" > /dev/null
ssh -o StrictHostKeyChecking=no slave2 "ssh -o StrictHostKeyChecking=no slave1 hostname" > /dev/null
ssh -o StrictHostKeyChecking=no slave2 "ssh -o StrictHostKeyChecking=no slave2 hostname" > /dev/null

#Sync Time
echo-log "Sync Time"
ssh slave1 "ntpdate master" &
ssh slave2 "ntpdate master" &
wait

#Start Service
source /etc/profile
echo-log "Start Zookeeper -> master"
zkServer.sh start
echo-log "Start Zookeeper -> Slave1"
ssh -o StrictHostKeyChecking=no slave1 "source /etc/profile ; zkServer.sh start"
echo-log "Start Zookeeper -> Slave2"
ssh -o StrictHostKeyChecking=no slave2 "source /etc/profile ; zkServer.sh start"
echo-log "Format HDFS"
hadoop namenode -Format > /dev/null
echo-log "Start HDFS"
start-dfs.sh > /dev/null
echo-log "Start YARN"
start-yarn.sh > /dev/null
echo-log "Start SPARK"
$SPARK_HOME/sbin/start-all.sh > /dev/null

#Check
./check.sh

endtime=`date +'%Y-%m-%d %H:%M:%S'`
start_seconds=$(date --date="$starttime" +%s);
end_seconds=$(date --date="$endtime" +%s);
echo "Run time: "$((end_seconds-start_seconds))"s"