#! /bin/bash

function download-from-iis
{
    wget http://192.168.1.2/install.sh -O install.sh
    chmod a+x install.sh
    ./install.sh
}

function download-from-github
{
    yum install git -y
    git clone https://github.com/zuozishi/HDP-scripts.git
    cd ./HDP-scripts

    cp /opt/soft/jdk-8u171-linux-x64.tar.gz ./pkgs/jdk.tar.gz
    cp /opt/soft/zookeeper-3.4.10.tar.gz ./pkgs/zookeeper.tar.gz
    cp /opt/soft/hadoop-2.7.3.tar.gz ./pkgs/hadoop.tar.gz
    cp /opt/soft/scala-2.11.12.tgz ./pkgs/scala.tgz
    cp /opt/soft/spark-2.4.0-bin-hadoop2.7.tgz ./pkgs/spark.tgz
}