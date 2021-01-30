---
title: 'how to use linux'
toc: true
date: 2021-01-28 11:05:45
tags:
  - linux
  - blog
categories:
  - HowToUse

---



- [ubuntu下crontab启动，重启，关闭命令](#ubuntu下crontab启动重启关闭命令)
- [bash设置代理](#bash设置代理)
- [linux 添加用户](#linux-添加用户)
- [lnmp](#lnmp)
- [多彩日志](#多彩日志)

<!--more-->


# ubuntu下crontab启动，重启，关闭命令

```
启动：/etc/init.d/cron start ( service cron start )
重启：/etc/init.d/cron restart ( service cron restart )
关闭：/etc/init.d/cron stop ( service cron stop )
```


# bash设置代理

```sh
export https_proxy=10.0.0.52:8080
export https_proxy=user:pass@192.158.8.8:8080
export https_proxy=socks://10.0.0.52:1080
export https_proxy=socks4://10.0.0.52:1080
export https_proxy=socks5://10.0.0.52:1080
```


# linux 添加用户
```
 useradd -m getianmeng
 passwd getianmeng W4v1iQt*****************
```
 添加yum的root执行权限
```
#vim sudoers
cd /etc/sudoers.d
```
`getianmeng ALL=(root) /usr/bin/yum`


# lnmp

```sh
php -S 0.0.0.0:8080 index.php

sudo service nginx reload
sudo service nginx restart

sudo service php-fpm reload
sudo service php-fpm restart


mysqldump  -h 10.0.1.90 -u username  -p  -P 3306 --no-data  --skip-lock-table --databases databaseName > dump.sql
mysql -h 10.0.2.72 -u username -p -P 3306 bookorder < dump.sql 

*
ssh-keygen -t rsa 
cat id_rsa.pub >> authorized_keys  
```



# 多彩日志
```sh
tail -f test_stub.log |  perl -pe 's/(500)|(200)|(404)|(error)/\e[1;31m$1\e\e[1;32m$2\e\e[1;36m$3\e\e[1;31m$4\e[0m/g'  

echo -e "\033[30m 黑色字 \033[0m"
echo -e "\033[31m 红色字 \033[0m"
echo -e "\033[32m 绿色字 \033[0m"
echo -e "\033[33m 黄色字 \033[0m"
echo -e "\033[34m 蓝色字 \033[0m"
echo -e "\033[35m 紫色字 \033[0m"
echo -e "\033[36m 天蓝字 \033[0m"
echo -e "\033[37m 白色字 \033[0m"

echo -e "\033[40;37m 黑底白字 \033[0m"
echo -e "\033[41;37m 红底白字 \033[0m"
echo -e "\033[42;37m 绿底白字 \033[0m"
echo -e "\033[43;37m 黄底白字 \033[0m"
echo -e "\033[44;37m 蓝底白字 \033[0m"
echo -e "\033[45;37m 紫底白字 \033[0m"
echo -e "\033[46;37m 天蓝底白字 \033[0m"
echo -e "\033[47;30m 白底黑字 \033[0m"
```