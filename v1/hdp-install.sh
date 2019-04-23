#! /bin/bash

softdir="/usr"
java_v="jdk1.8.0_171"
zk_v="zookeeper-3.4.10"
hdp_v="hadoop-2.7.3"
scala_v="scala-2.11.12"
spark_v="spark-2.4.0-bin-hadoop2.7"
#hbase_v="hbase-1.2.4"

mkdir $softdir

function echo-log
{
    echo -e "\033[32m$1\033[0m"
}

function send-soft
{
    scp -r $softdir/$java_v slave1:$softdir/$java_v
    scp -r $softdir/$java_v slave2:$softdir/$java_v

    scp -r $softdir/$zk_v slave1:$softdir/$zk_v
    scp -r $softdir/$zk_v slave2:$softdir/$zk_v

    scp $softdir/$zk_v/zkdata/id2 slave1:$softdir/$zk_v/zkdata/myid
    scp $softdir/$zk_v/zkdata/id3 slave2:$softdir/$zk_v/zkdata/myid

    scp -r $softdir/$hdp_v slave1:$softdir/$hdp_v
    scp -r $softdir/$hdp_v slave2:$softdir/$hdp_v

    scp -r $softdir/$scala_v slave1:$softdir/$scala_v
    scp -r $softdir/$scala_v slave2:$softdir/$scala_v

    scp -r $softdir/$spark_v slave1:$softdir/$spark_v
    scp -r $softdir/$spark_v slave2:$softdir/$spark_v

    #scp -r $softdir/$hbase_v slave1:$softdir/$hbase_v
    #scp -r $softdir/$hbase_v slave2:$softdir/$hbase_v

    scp /etc/profile slave1:/etc/profile
    scp /etc/profile slave2:/etc/profile
}

function install-java
{
    echo-log "Installing $java_v..."
    tar -zxvf ./pkgs/jdk.tar.gz -C $softdir
    echo "export JAVA_HOME=$softdir/$java_v" >> /etc/profile
    echo "export CLASSPATH=\$JAVA_HOME/lib/" >> /etc/profile
    echo "export PATH=\$PATH:\$JAVA_HOME/bin" >> /etc/profile
    echo "export PATH JAVA_HOME CLASSPATH" >> /etc/profile
    source /etc/profile
    java -version
}

function install-zookeeper
{
    echo-log "Installing $zk_v..."
    tar -zxvf ./pkgs/zookeeper.tar.gz -C $softdir
    zoocfg="$softdir/$zk_v/conf/zoo.cfg"
    echo "tickTime=2000" > $zoocfg
    echo "initLimit=10" >> $zoocfg
    echo "syncLimit=5" >> $zoocfg
    echo "dataDir=$softdir/$zk_v/zkdata" >> $zoocfg
    echo "clientPort=2181" >> $zoocfg
    echo "dataLogDir=$softdir/$zk_v/zkdatalog" >> $zoocfg
    echo "server.1=master:2888:3888" >> $zoocfg
    echo "server.2=slave1:2888:3888" >> $zoocfg
    echo "server.3=slave2:2888:3888" >> $zoocfg
    mkdir $softdir/$zk_v/zkdata
    mkdir $softdir/$zk_v/zkdatalog
    echo "1" > $softdir/$zk_v/zkdata/id1
    echo "2" > $softdir/$zk_v/zkdata/id2
    echo "3" > $softdir/$zk_v/zkdata/id3
    if ([ $(hostname) == "master" ]) then
        echo "1" > $softdir/$zk_v/zkdata/myid
    fi
    if ([ $(hostname) == "slave1" ]) then
        echo "2" > $softdir/$zk_v/zkdata/myid
    fi
    if ([ $(hostname) == "slave2" ]) then
        echo "3" > $softdir/$zk_v/zkdata/myid
    fi
    if ([ $(hostname) == "slave3" ]) then
        echo "4" > $softdir/$zk_v/zkdata/myid
    fi
    echo "export ZOOKEEPER_HOME=$softdir/$zk_v" >> /etc/profile
    echo "export PATH=\$PATH:\$ZOOKEEPER_HOME/bin" >> /etc/profile
    source /etc/profile
}

function install-hadoop
{
    echo-log "Installing $hdp_v..."
    tar -zxvf ./pkgs/hadoop.tar.gz -C $softdir
    echo "export HADOOP_HOME=$softdir/$hdp_v" >> /etc/profile
    echo "export CLASSPATH=\$CLASSPATH:\$HADOOP_HOME/lib" >> /etc/profile
    echo "export PATH=\$PATH:\$HADOOP_HOME/bin" >> /etc/profile
    source /etc/profile
    hdpcfg=$softdir/$hdp_v/etc/hadoop
    cp ./conf/core-site.xml $hdpcfg/core-site.xml
    cp ./conf/hdfs-site.xml $hdpcfg/hdfs-site.xml
    cp ./conf/yarn-site.xml $hdpcfg/yarn-site.xml
    cp ./conf/hadoop-env.sh $hdpcfg/hadoop-env.sh
    cp $hdpcfg/mapred-site.xml.template $hdpcfg/mapred-site.xml
    echo "master" > $hdpcfg/master
    echo "slave1" > $hdpcfg/slaves
    echo "slave2" >> $hdpcfg/slaves
}

function install-scala
{
    echo-log "Installing $scala_v..."
    tar -zxvf ./pkgs/scala.tgz -C $softdir
    echo "export SCALA_HOME=$softdir/$scala_v" >> /etc/profile
    echo "export PATH=\$PATH:\$SCALA_HOME/bin" >> /etc/profile
    source /etc/profile
    scala -version
}

function install-spark
{
    echo-log "Installing $spark_v..."
    tar -zxvf ./pkgs/spark.tgz -C $softdir

    echo "export SPARK_MASTER_IP=master" > $softdir/$spark_v/conf/spark-env.sh
    echo "export SCALA_HOME=$softdir/$scala_v" >> $softdir/$spark_v/conf/spark-env.sh
    echo "export SPARK_WORKER_MEMORY=8g" >> $softdir/$spark_v/conf/spark-env.sh
    echo "export JAVA_HOME=$softdir/$java_v" >> $softdir/$spark_v/conf/spark-env.sh
    echo "export HADOOP_HOME=$softdir/$hdp_v" >> $softdir/$spark_v/conf/spark-env.sh
    echo "export HADOOP_CONF_DIR=$softdir/$hdp_v/etc/hadoop" >> $softdir/$spark_v/conf/spark-env.sh

    echo "slave1" > $softdir/$spark_v/conf/slaves
    echo "slave2" >> $softdir/$spark_v/conf/slaves
    echo "export SPARK_HOME=$softdir/$spark_v" >> /etc/profile
    echo "export PATH=\$PATH:\$SPARK_HOME/bin" >> /etc/profile
    source /etc/profile
}

function install-hbase
{
    echo-log "Installing $hbase_v..."
    tar -zxvf ./pkgs/hbase.tar.gz -C $softdir
    hbcfg=$softdir/$hbase_v/conf
    echo "slave1" > $hbcfg/regionservers
    echo "slave2" >> $hbcfg/regionservers
    cp ./conf/hbase-site.xml $hbcfg/hbase-site.xml
    cp ./conf/hbase-env.sh $hbcfg/hbase-env.sh
    cp $softdir/$hdp_v/etc/hadoop/hdfs-site.xml $hbcfg/hdfs-site.xml
    cp $softdir/$hdp_v/etc/hadoop/core-site.xml $hbcfg/core-site.xml
    echo "export HBASE_HOME=$softdir/$hbase_v" >> /etc/profile
    echo "export PATH=\$PATH:\$HBASE_HOME/bin" >> /etc/profile
    source /etc/profile
}

install-java

install-zookeeper

install-hadoop

install-scala

install-spark

#install-hbase

if [[ $(hostname) == "master" ]]
then
    if (whiptail --title "master" --yesno "Send software to slaves ?" 10 60) then
        send-soft 
    fi
fi