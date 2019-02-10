#! /bin/bash

java_v="jdk1.8.0_201"
zk_v="zookeeper-3.4.10"
hdp_v="hadoop-2.7.6"
hbase_v="hbase-1.2.4"

function echo-log
{
    echo -e "\033[32m$1\033[0m"
}

function install-java
{
    echo-log "Installing $java_v..."
    mkdir /usr/java
    tar -zxvf ./pkgs/jdk.tar.gz -C /usr/java/
    echo "export JAVA_HOME=/usr/java/$java_v" >> /etc/profile
    echo "export CLASSPATH=\$JAVA_HOME/lib/" >> /etc/profile
    echo "export PATH=\$PATH:\$JAVA_HOME/bin" >> /etc/profile
    echo "export PATH JAVA_HOME CLASSPATH" >> /etc/profile
    source /etc/profile
    java -version
}

function install-zookeeper
{
    echo-log "Installing $zk_v..."
    mkdir /usr/zookeeper
    tar -zxvf ./pkgs/zookeeper.tar.gz -C /usr/zookeeper/
    zoocfg="/usr/zookeeper/$zk_v/conf/zoo.cfg"
    echo "tickTime=2000" > $zoocfg
    echo "initLimit=10" >> $zoocfg
    echo "syncLimit=5" >> $zoocfg
    echo "dataDir=/usr/zookeeper/$zk_v/zkdata" >> $zoocfg
    echo "clientPort=2181" >> $zoocfg
    echo "dataLogDir=/usr/zookeeper/$zk_v/zkdatalog" >> $zoocfg
    echo "server.1=master:2888:3888" >> $zoocfg
    echo "server.2=slave1:2888:3888" >> $zoocfg
    #echo "server.3=slave2:2888:3888" >> $zoocfg
    #echo "server.4=slave3:2888:3888" >> $zoocfg
    mkdir /usr/zookeeper/$zk_v/zkdata
    mkdir /usr/zookeeper/$zk_v/zkdatalog
    if ([ $(hostname) == "master" ]) then
        echo "1" > /usr/zookeeper/$zk_v/zkdata/myid
    fi
    if ([ $(hostname) == "slave1" ]) then
        echo "2" > /usr/zookeeper/$zk_v/zkdata/myid
    fi
    if ([ $(hostname) == "slave2" ]) then
        echo "3" > /usr/zookeeper/$zk_v/zkdata/myid
    fi
    if ([ $(hostname) == "slave3" ]) then
        echo "4" > /usr/zookeeper/$zk_v/zkdata/myid
    fi
    echo "export ZOOKEEPER_HOME=/usr/zookeeper/$zk_v" >> /etc/profile
    echo "export PATH=\$PATH:\$ZOOKEEPER_HOME/bin" >> /etc/profile
    source /etc/profile
}

function install-hadoop
{
    echo-log "Installing $hdp_v..."
    mkdir /usr/hadoop
    tar -zxvf ./pkgs/hadoop.tar.gz -C /usr/hadoop/
    echo "export HADOOP_HOME=/usr/hadoop/$hdp_v" >> /etc/profile
    echo "export CLASSPATH=\$CLASSPATH:\$HADOOP_HOME/lib" >> /etc/profile
    echo "export PATH=\$PATH:\$HADOOP_HOME/bin" >> /etc/profile
    source /etc/profile
    hdpcfg=/usr/hadoop/$hdp_v/etc/hadoop
    cp ./conf/core-site.xml $hdpcfg/core-site.xml
    cp ./conf/hdfs-site.xml $hdpcfg/hdfs-site.xml
    cp ./conf/yarn-site.xml $hdpcfg/yarn-site.xml
    cp ./conf/hadoop-env.sh $hdpcfg/hadoop-env.sh
    cp $hdpcfg/mapred-site.xml.template $hdpcfg/mapred-site.xml
    echo "master" > $hdpcfg/master
    echo "slave1" > $hdpcfg/slaves
}

function install-hbase
{
    echo-log "Installing $hbase_v..."
    mkdir /usr/hbase
    tar -zxvf ./pkgs/hbase.tar.gz -C /usr/hbase/
    hbcfg=/usr/hbase/$hbase_v/conf
    echo "slave1" > $hbcfg/regionservers
    cp ./conf/hbase-site.xml $hbcfg/hbase-site.xml
    cp ./conf/hbase-env.sh $hbcfg/hbase-env.sh
    cp /usr/hadoop/$hdp_v/etc/hadoop/hdfs-site.xml $hbcfg/hdfs-site.xml
    cp /usr/hadoop/$hdp_v/etc/hadoop/core-site.xml $hbcfg/core-site.xml
    echo "export HBASE_HOME=/usr/hbase/$hbase_v" >> /etc/profile
    echo "export PATH=\$PATH:\$HBASE_HOME/bin" >> /etc/profile
    source /etc/profile
}

install-java

install-zookeeper

install-hadoop

install-hbase