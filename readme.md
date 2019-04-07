# Hadoop-scripts: Hadoop集群及应用部署脚本

## 脚本文件列表

### [hdp-config.sh](./hdp-config.sh) (系统初始化)

> 注意：脚本运行前确认net-tools、wget、whiptail是否安装。
> 
> yum install net-tools wget whiptail -y

- 禁用防火墙
- 改用阿里云yum源
- 修改hostname（仅限：master、slave1、slave2）
- 配置静态IP
- 修改hosts文件
- 配置ssh密钥
- 时区调整、NTP服务配置

### [hdp-install.sh](./hdp-install.sh) (软件安装配置)

> ~~注意：此步骤完成时需要重启系统。~~

- jdk1.8.0_171
- zookeeper-3.4.10
- hadoop-2.7.3
- ~~hbase-1.2.4~~
- scala-2.11.12
- spark-2.4.0

### [hdp-start.sh](./hdp-start.sh) (启动服务)

```
$ZOOKEEPER_HOME/bin/zkServer.sh start

if master
    $HADOOP_HOME/sbin/start-all.sh
    $SPARK_HOME/sbin/start-all.sh
end if
```

![](https://github.com/0xHJK/music-dl/raw/master/docs/fork.png)

## 更新记录

- 2019-02-10 第一次提交