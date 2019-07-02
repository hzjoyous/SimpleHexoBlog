---
title: 工具箱
date: 2018-11-05 15:25:38
tags: tool
categories: tool
---


# my_win

> 关于 windows 独占的工具使用

##

```bat
# 一个控制台的调色工具 ms 官方提供
https://github.com/Microsoft/console/releases/tag/1708.14008

```

## my_wsl

```sh
# github_page 本地配置，具体安装。。。忘了
# 如果使用 kali 版本的 wsl 则安装非常省事，具体见百度
alias blogrun='bundle exec jekyll serve'
```

# linux 

## command

```sh
#匹配文件后缀为 .jpg 的文件并且删除
find ./ -name '*.jpg'  | xargs rm 

# svn 根据提交人过滤 / sed 命令的使用
svn log --limit 10 -v | sed -n '/username/,/-----$/ p' 

# 多彩日志
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

ps -ef|grep "zhaoyinfan/supervisor" | grep -v grep | awk '{print $1}' | xargs kill -9

#ps -ef|grep "zhaoyinfan/supervisor" | grep -v grep | awk '{print $2 " " $9" "$10" "$11}' > resupervisord && cat  resupervisord | awk '{print $1}'  | xargs kill -9  &&  cat  resupervisord | awk '{print $2" " $3" " $4}' > resupervisord && sh resupervisord && rm resupervisord
```


# git

```sh
git config user.name 'github用户名'  
git config user.email '邮箱'  

# 初始化
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:hzj991/hexo.git
git push -u origin master


# 切换远程分支
git remote rm origin
git remote add origin git@github.com:hzj991/hexo-next.git
git push --set-upstream origin master

# 使用 vimdiff 进行 git diff
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.d difftool

# 清除提交记录缓存
git rm --cached application.log
git rm -r --cached .  
git add .gitignore  
git commit -m "update .gitignore"  
git remote add origin git@23123.com
git remote prune origin


# 如果是linux和windows混合开发，很容易会遇到行尾换行符的问题，windows下默认是\r\n，linux下是\n。如果没做处理，git提交时很有可能产生问题，解决办法为设置git config的 core.autocrlf，
git config --global core.autocrlf true # 表示自动更换crlf，windows下如果checkout是\n，则自动换为\r\n，在提交时在自动换回\n
git config --global core.autocrlf input # 自动把\r\n换为\n
git config --global core.autocrlf false # 就是不作处理
# 如果已经产生了\r\n，merge时产生问题，可以设置
git config merge.renormalize true # merge时忽略行尾对比
如果只需要执行一次merge可以是用命令
git merge -s recursive -X ignore-space-at-eol origin/master
# 还可以设置crlf安全检查
git config --global core.safecrlf true # 禁止提交混合\n和\r\n的文件
git config --global core.safecrlf false # 允许提交
git config --global core.safecrlf warn # 提交时产生警告

# 如果经常产生文件属性变更的情况，可以设置
git config --global core.filemode false

```


扩展:
- [几乎所有的 git 撤销](http://blog.jobbole.com/87700/)

```sh
cd /home/users/hzj/tmpgit/web/                                                                                                                                                                                
git checkout master                                                                                                                                                                                                 
oldTimetime=$(date -d "3 days ago" +%Y_%m_%d_%H)                                                                                                                                                                    
git branch -d hotfix/hzj/${oldTimetime}                                                                                                                                                                       
git push origin --delete hotfix/hzj/${oldTimetime}                                                                                                                                                            
git pull                                                                                                                                                                                                            
time=$(date "+%Y_%m_%d_%H")                                                                                                                                                                                         
branchName=hotfix/hzj/${time}                                                                                                                                                                                 
git checkout -b ${branchName}                                                                                                                                                                                       
git pull                                                                                                                                                                                                            
git push origin ${branchName}:${branchName}     
```


```git

```


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

# linux 
添加用户
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