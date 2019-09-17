# Slave2

## 关闭和禁用防火墙
```
systemctl stop firewalld
systemctl disable firewalld
```

## 主机名和Hosts
```
hostname master
hostname slave1
hostname slave2
hostname > /etc/hostname

echo "192.168.1.201 master" >> /etc/hosts
echo "192.168.1.202 slave1" >> /etc/hosts
echo "192.168.1.203 slave2" >> /etc/hosts
```

## 环境变量
```
export JAVA_HOME=/usr/java
export HADOOP_HOME=/usr/hadoop
export SCALA_HOME=/usr/scala
export ZOOKEEPER_HOME=/usr/zookeeper
export SPARK_HOME=/usr/spark
export HBASE_HOME=/usr/hbase
export PATH=$PATH:$JAVA_HOME/bin:$ZOOKEEPER_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$SCALA_HOME/bin:$SPARK_HOME/bin:$HBASE_HOME/bin
```

## SSH无密码登录
```
ssh-keygen -t rsa
Slave1 & Slave2: scp ~/.ssh/id_rsa.pub root@master:~/.ssh/$(hostname).pub

cd ~/.ssh
cat id_rsa.pub > authorized_keys
cat slave1.pub > authorized_keys
cat slave2.pub > authorized_keys
scp authorized_keys root@slavev1:~/.ssh/authorized_keys
scp authorized_keys root@slavev2:~/.ssh/authorized_keys
```

## 解压软件
```
for tar in /opt/soft/*.{gz,tgz}
do
    (tar zxf $tar -C /usr) &
done
```

## Zookeeper
```
cd /usr/zookeeper
cp ./conf/zoo_sample.cfg ./conf/zoo.cfg
vi ./conf/zoo.cfg
- dataDir=/usr/zookeeper/zkdata
- server.1=master:2888:3888
- server.2=slave1:2888:3888
- server.3=slave2:2888:3888
mkdir zkdata
cat 1 > ./zkdata/myid
cat 2 > ./zkdata/myid
cat 3 > ./zkdata/myid
/usr/zookeeper/bin/zkServer.sh start
```

## Spark
```
vi /usr/spark/conf/spark-env.sh
- export SPARK_MASTER_IP=master
- export SCALA_HOME=/usr/scala
- export SPARK_WORKER_MEMORY=8g
- export JAVA_HOME=/usr/java
- export HADOOP_HOME=/usr/hadoop
- export HADOOP_CONF_DIR=/usr/hadoop/etc/hadoop
vi /usr/spark/conf/slaves
- slave1
- slave2

$SPARK_HOME/sbin/start-all.sh
```

## MySQL
```
yum localinstall /opt/soft/mysql/*.rpm -y
systemctl start mysqld
#查看默认密码
cat /var/log/mysqld.log | grep password
mysql_secure_installation
mysql -u root -p
grant all privileges on *.* to 'root'@'%' identified by '123123' with grant option;
flush privileges;
```