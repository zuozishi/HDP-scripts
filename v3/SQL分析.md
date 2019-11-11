# SQL分析

## 单车租赁分析

### 数据结构
* 骑行时间（毫秒为单位）：Duration (ms)
* 开始时间：Start date
* 结束时间：End date
* 开始地点数：Start station number
* 开始地点：Start station
* 结束地点数：End station number
* 结束地点：End station
* 单车车号：Bike number
* 用户类型：Member type（Member 会员/ Casual临时会员）

### 建表并导入数据（Hive）
```
create database hive;
use hive;
create table bike(
    duration int,
    startdate timestamp,
    enddate timestamp,
    startnum int,
    startstation string,
    endnum int,
    endstation string,
    bikenum string,
    type string
) row format delimited fields terminated by ',';
load data local inpath '/root/dataset1.txt' into table bike;
```

### 分析
1、统计本次数据所有单车数量  
`select count(distinct bikenum) from bike;`  
2、计算单车平均用时(分)  
`select round(avg(duration)/60000) from bike;`  
3、计算会员与非会员用户的占比  
 #计算总数(42405)  
`select count(*) from bike;`  
#计算占比  
`select count(*),type,concat(round(count(*)/42405*100,2),'%') from bike group by type;` 
```
SELECT type,typenum,concat(round(typenum/total*100,2),'%')
FROM
(select count(*) as total from bike) a
JOIN
(select count(*) as typenum,type from bike group by type) b;
```  
4、计算骑行时间大约一小时的占比
```
SELECT count1/total
FROM
(select count(*) as total from bike) a
JOIN
(select count(*) as count1 from bike where duration > 60000*60) b;
```