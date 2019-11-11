# SQL分析

## 人员信息分析

### 数据结构
* age - 年龄
* workclass - 工作类型
* fnlwgt - 序号
* education - 教育程度
* education_num - 受教育时间
* marital_status - 婚姻状况
* occupation - 职业
* relationship - 关系
* race - 种族
* sex - 性别
* capital_gain - 资本收益
* capital_loss - 资本损失
* hours_per_week - 每周工作小时数
* native_country - 原籍
* high_income - 收入

### 建表并导入数据（Hive）
```
create table person(
    age double,
    workclass string,
    fnlwgt string,
    education string,
    education_num double,
    marital_status string,
    occupation string,
    relationship string,
    race string,
    sex string,
    capital_gain string,
    capital_loss string,
    hours_per_week double,
    native_country string,
    high_income string
) row format delimited fields terminated by ',';
```

## 单车租赁分析

### 数据结构
* duration - 骑行时间（毫秒为单位）
* startdate - 开始时间
* enddate - 结束时间
* startnum - 开始地点数
* startstation - 开始地点
* endnum - 结束地点数
* endstation - 结束地点
* bikenum - 单车车号
* type - 用户类型（Member 会员/ Casual临时会员）

### 建表并导入数据（Hive）
```
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
4、计算骑行时间大于一小时的占比
```
SELECT count1/total
FROM
(select count(*) as total from bike) a
JOIN
(select count(*) as count1 from bike where duration > 60000*60) b;
```