#! /bin/bash

serverip="192.168.1.2"

rm -rf ./HDP-scripts
mkdir HDP-scripts
cd HDP-scripts
wget http://$serverip/hdp-config.sh
wget http://$serverip/hdp-install.sh
wget http://$serverip/hdp-start.sh
wget http://$serverip/setup.sh
mkdir ./conf
wget -O ./conf/ifcfg-ens33.txt http://$serverip/conf/ifcfg-ens33.txt
wget -O ./conf/hbase-site.xml http://$serverip/conf/hbase-site.xml
wget -O ./conf/core-site.xml http://$serverip/conf/core-site.xml
wget -O ./conf/hdfs-site.xml http://$serverip/conf/hdfs-site.xml
wget -O ./conf/yarn-site.xml http://$serverip/conf/yarn-site.xml
wget -O ./conf/hadoop-env.sh http://$serverip/conf/hadoop-env.sh
wget -O ./conf/hbase-env.sh http://$serverip/conf/hbase-env.sh
mkdir ./pkgs
wget -O ./pkgs/jdk.tar.gz http://$serverip/pkgs/jdk-8u171-linux-x64.tar.gz
wget -O ./pkgs/zookeeper.tar.gz http://$serverip/pkgs/zookeeper-3.4.10.tar.gz
wget -O ./pkgs/hadoop.tar.gz http://$serverip/pkgs/hadoop-2.7.3.tar.gz
wget -O ./pkgs/scala.tgz http://$serverip/pkgs/scala-2.11.12.tgz
wget -O ./pkgs/spark.tgz http://$serverip/pkgs/spark-2.4.0-bin-hadoop2.7.tgz
chmod a+x *.sh
#./setup.sh