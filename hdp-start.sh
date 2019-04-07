#! /bin/bash

function echo-log
{
    echo -e "\033[32m$1\033[0m"
}

echo-log "Starting zookeeper..."
$ZOOKEEPER_HOME/bin/zkServer.sh stop
$ZOOKEEPER_HOME/bin/zkServer.sh start
echo-log "Press any key to continue."

if ([ $(hostname) == "master" ]) then
    echo-log "Will start hadoop."
    read
    $ZOOKEEPER_HOME/bin/zkServer.sh status
    echo-log "Starting hadoop..."
    $HADOOP_HOME/sbin/start-all.sh
    echo-log "Will start Spark."
    echo-log "Press any key to continue."
    #echo-log "Will start HBase."
    read
    $SPARK_HOME/sbin/start-all.sh
    #$HBASE_HOME/bin/start-hbase.sh
fi