---
title: mysql
date: '2018-11-04T23:25:38+08:00'
tags:
    - mysql
categories:
    - mysql

---



# mysql 密码重置那些事儿

好久没有整理云服务器，今天上去把前端代码和服务端代码进行了一下拆分，结果发现忘记了mysql的密码（真·很久没有用过）~,于是去查了一下MySQL的密码重置操作，
[MySQL(root用户)密码重置](https://www.cnblogs.com/jiunadianshi/articles/2007102.html)，
其实就是除了正常的启动 MySQL 之外还可以通过 MySQL 提供的另个可执行文件进行安全启动，我的安装的版本是 mysqld_safe ，找不到的同学可以先用 which mysql 然后进入 mysql 的安装目录查找带有 safe 的可执行文件，执行后通过密码重置语句进行更改就可以愉快的继续使用了
```mysql
use mysql
update user set password=password("new_pass") where user="root";
flush privileges
```

### mysql 8.0 导致的 pdo 链接问题
```shell
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'root';
flush privileges;
```