---
title: mysql
date: 2020-06-25 21:28:53
tags: database
categories: database
---

# crud

create
- create
- alter
- insert
read
- select
update
- update
delete
- delete
- truncate

### create

```sql
-- 创建数据库
create database simple_demo;
-- 选择数据库
use simple_demo;
-- 创建表
CREATE TABLE `users` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '车场ID' ,
    `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email_verified_at` timestamp NULL DEFAULT NULL,
    `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10790252 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- 展示建表语句 + /G 为格式化输出
show create table users
show create table users\G
desc users
desc users\G

```

#### alter

```sql
-- 去除索引
alter table users drop index `users_email_unique`;
-- 增加字段
alter table user add age int ;
-- 更改字段类型
alter table user modify s int;
-- 更改字段名+字段类型
alter table user change s sex int;
```


### insert

```sql
-- 插入一条数据，且对应字段
insert into `bookorder` (`id`,`price`) values("123",123.12);
-- 插入一条数据，且对应默认字段
insert into `bookorder` values("123",123.12);
-- 插入多条数据，且对应默认字段
insert into `bookorder` values("123",123.12),values("124",123.12);

```


### read

```sql
-- 查询所有数据
select * from bookorder;
-- 别名
select * from bookorder as b;
-- id升序 ，限制10条
select * from bookorder as b order by id limit 10;
-- id降序，从第10条起取3条数据
select * from bookorder as b order by id desc limit 10,3;
-- 内联
select * from loginunit as l inner join loginUnit as address on l.id = address.luid;
-- 左连接，即使右边数据没有
select * from loginunit as l left join smartlock as s on l.id = s.luid;
-- adderssid 字段非 null 的 并且 city 为 1或2或3
select * from loginunit where addressid is not null and city in (1,2,3);
```


### update

```sql
update bookorder set status='wait' where status='pay';
```

### delete

```sql
-- 删除数据，索引不重置
delete from bookorder where createtime >'2019-01-01';
-- 删除数据，重置索引
truncate table bookorder;
```


### other 

```sql
-- 统计某table占用空间，其中TABLE_SCHEMA为数据库名，TABLE_NAME为表名
select
TABLE_NAME,
concat(truncate(data_length/1024/1024,2),' MB') as data_size,
concat(truncate(index_length/1024/1024,2),' MB') as index_size
from information_schema.tables
where TABLE_SCHEMA = 'simple_laravel'
order by data_length desc;
```

<!--more-->


