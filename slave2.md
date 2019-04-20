# Slave2

## Firewalld
```
systemctl stop firewalld
systemctl disable firewalld
```

## Hostname & hosts
```
hostname slave2
echo slave2 > /etc/hostname

echo "192.168.1.201 master" >> /etc/hosts
echo "192.168.1.202 slave1" >> /etc/hosts
echo "192.168.1.203 slave2" >> /etc/hosts

scp /etc/hosts master:/etc/hosts
scp /etc/hosts slave1:/etc/hosts
```

## Env
```
root@slave2# vi /etc/profile

export JAVA_HOME=/usr/jdk
export ZOOKEEPER_HOME=/usr/zookeeper
export HADOOP_HOME=/usr/hadoop
export SCALA_HOME=/usr/scala
export SPARK_HOME=/usr/spark
export PATH=$PATH:JAVA_HOME/bin:$ZOOKEEPER_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$SCALA_HOME/bin:$SPARK_HOME/bin

root@slave2# scp /etc/profile master:/etc/profile
root@slave2# scp /etc/profile slave1:/etc/profile
```

## Zookeeper
```
tar -vxzf zookeeper-3.4.10.tar.gz
mkdir zookeeper
cp -r zookeeper-3.4.10/* zookeeper
rm -rf zookeeper-3.4.10

cd zookeerper
mkdir zkdata
mkdir zkdatalog
cp conf/zoo_sample.cfg conf/zoo.cfg
vi conf/zoo.cfg

dataDir=/usr/zookeeper/zkdata
dataLogDir=/usr/zookeeper/zkdatalog
server.1=master:2888:3888
server.2=slave1:2888:3888
server.3=slave2:2888:3888

echo "3" > /usr/zookeeper/zkdata/myid
echo "1" > /usr/zookeeper/zkdata/id1
echo "2" > /usr/zookeeper/zkdata/id2

scp -r /usr/zookeeper master@/usr/zookeeper
scp -r /usr/zookeeper slave1@/usr/zookeeper
scp /usr/zookeeper/zkdata/id1 master@/usr/zookeeper/zkdata/myid
scp /usr/zookeeper/zkdata/id2 slave1@/usr/zookeeper/zkdata/myid
```