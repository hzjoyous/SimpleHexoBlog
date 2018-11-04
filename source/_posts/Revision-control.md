---
title: Revision control
date: 2018-11-04 15:25:38
tags: tool
categories: tool
---


### svn

回滚
```shell 
svn merge -rhead:[old version] [file]
#将file 的 old 版本合并到当前 
```

合并分支
```shell
svn --dry-run merge -r51744:head svn://svn1.idc.xiaozhu.com/xiaozhu/webV2/branches/dev/r_neworderv2-hanzhijie-2018-09-13
#展示效果不实际执行
svn  merge -r51744:head svn://svn1.idc.xiaozhu.com/xiaozhu/webV2/branches/dev/r_neworderv2-hanzhijie-2018-09-13
#将指定svn -r51744 到head 的所有变化 合并到当前本地仓库
```
