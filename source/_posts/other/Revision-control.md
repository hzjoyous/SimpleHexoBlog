---
title: Revision control (版本控制)
date: 2018-11-04 15:25:38
tags: tool
categories: tool
---

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

```

# svn

回滚
```sh 
svn merge -rhead:[old version] [file]
#将file 的 old 版本合并到当前 
```

合并分支
```sh
svn --dry-run merge -r51744:head svn://svn1.idc.xiaozhu.com/xiaozhu/webV2/branches/dev/r_neworderv2-hanzhijie-2018-09-13
#展示效果不实际执行
svn  merge -r51744:head svn://svn1.idc.xiaozhu.com/xiaozhu/webV2/branches/dev/r_neworderv2-hanzhijie-2018-09-13
#将指定svn -r51744 到head 的所有变化 合并到当前本地仓库
```


