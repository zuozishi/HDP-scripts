#! /bin/bash

serverip="192.168.1.2"

rm -rf ./HDP-scripts
mkdir HDP-scripts
cd HDP-scripts
wget http://$serverip/ifcfg-ens33.txt
wget http://$serverip/hdp-config.sh
wget http://$serverip/hdp-install.sh
wget http://$serverip/hdp-start.sh
wget http://$serverip/setup.sh
mkdir ./conf
wget -O ./conf/hbase-site.xml http://$serverip/conf/hbase-site.xml
wget -O ./conf/core-site.xml http://$serverip/conf/core-site.xml
wget -O ./conf/hdfs-site.xml http://$serverip/conf/hdfs-site.xml
wget -O ./conf/yarn-site.xml http://$serverip/conf/yarn-site.xml
wget -O ./conf/hadoop-env.sh http://$serverip/conf/hadoop-env.sh
wget -O ./conf/hbase-env.sh http://$serverip/conf/hbase-env.sh
mkdir ./pkgs
wget -O ./pkgs/jdk.tar.gz http://$serverip/pkgs/jdk-8u201-linux-x64.tar.gz
wget -O ./pkgs/zookeeper.tar.gz http://$serverip/pkgs/zookeeper-3.4.10.tar.gz
wget -O ./pkgs/hbase.tar.gz http://$serverip/pkgs/hbase-1.2.4-bin.tar.gz
wget -O ./pkgs/hadoop.tar.gz http://$serverip/pkgs/hadoop-2.7.6.tar.gz
chmod a+x *.sh
#./setup.sh