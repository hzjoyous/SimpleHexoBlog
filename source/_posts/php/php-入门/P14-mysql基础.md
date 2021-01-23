---
title: 'PHP[入门]P14-mysql基础'
date: '2017-01-01T09:01:14+08:00'
tags:
    - php
categories:
    - php

---



> 这是我早期的 php 学习笔记，php 的学习版本版本是 5.6、7，🐟2020/05/06年从有道笔记导出至此。


day14-mysql基础

1.数据库系统的组成部分

数据库系统 数据库 表 字段 数据

2.数据库分类

关系型数据库 非关系型数据库

3.SQL含义

Structured Query Language结构化查询语言

数据库的默认端口号是：3306

4.SQL的分类

DDL：数据定义语言 对数据库的库，表，字段的创建 修改 删除的操作

DML：数据的操作语言 主要对数据 进行增加 删除 修改

DQL：数据的查询语言 主要对数据进行查询

DCL：数据的控制语言

DTL：数据的事物

5.配置mysql相关环境变量

1.把mysql bin目录路径复制

2.打开计算机属性-》系统属性-》高级系统设置-》高级-》环境变量-》系统变量-》path
修改path值 不能删除以前的在值后边加上分号 把第一步路径粘贴上

3.关闭dos窗口 重新打开 mysql

启动dos:

1 开始菜单 -》搜索程序打开cmd 回车

2 win+R -\> cmd

不修改环境变量想执行mysql

切换到mysql bin 目录下

d:

cd 切换目录

6.链接数据库

mysql -hlocalhost -uroot -ppassword

主机名 用户名 密码

\*\*

如果访问的是本机的数据库 可以省略-h

链接mysql 时候 密码回车敲

退出mysql命令：

quit; exit;

help; \\h 帮助命令 \\c 清除历史 清除错误都可以使用

\\G 更友好的显示

注意： 语句结束切记不要忘记分号

7.基本命令

show databases; 显示 当前所有的数据库

create database databasename; 创建数据库

drop database databasename; 删除数据库

use databasename; 选中数据库 使用数据库

show create database databasename; 显示库结构

8.表语句

show tables; 显示当前选中的库中的所有表

create table tablename(字段名 类型, 字段名 类型,字段名类型); 创建一个表

desc tablename; 查看选中的表的结构

drop table tablename; 删除选中的表

alter table tablename modify 字段名 varchar(40); 修改表字段类型

alter table 表名 add 字段名 字段类型; 增加字段

alter table 表名 add 字段名 字段类型 after 字段名;
增加字段设置字段的位置

alter table 表名 add 字段名 字段类型 first; 增加的字段放在字段的最前边

alter table tablename drop 字段名; 删除表中字段

alter table tablename change 字段原名 新字段名 数据类型;修改表中的字段名

alter table tablename rename newtablename; 修改表名

\*字段增加和修改语句(add/change/modify)中，最后都可以加一个可选项
first\|after。

\-\-\-\-\-\-\-\-\--

修改表字段

alter table tablename \[modify/add/change/drop\]

创建表语句的时候每次都要指定存储引擎 和字符集

engine = innodb

default charset=utf8

解决每次都要设置表引擎和字符集修改mysql配置文件my.ini

my.ini 打开方式 直接在小绿W打开
也可以在wamp64/bin/mysql/mysql5.7.9/my.ini

修改

default-storage-engine=InnoDB

添加

character\_set\_server=utf8

\-\-\-\-\-\-\--

注：一定先use 使用库以后才能操作选中的这个库里面的数据

\-\-\-\-\-\-\-\-\-\--

json\_encode 将字符串转换成json字符串
一般用于最多的时候就是将数组转成json

json\_decode 将json串转成 object，第二个参数传true 才返回的是数组

\-\-\-\-\-\-\-\-\-\--

作业：

测试：字段增加和修改语句(add/change/modify)中，最后都可以加一个可选项
first\|after。

罚写：全员 数组函数 字符串函数 两遍
