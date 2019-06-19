---
title: regex
date: 2018-12-05 15:25:38
tags: tool
categories: tool
---


```regex
#匹配出所有的codecept_debug代码,包括已经注释掉的
(//)?codecept_debug\(.*\)(;)?
# 匹配单行sql
^select (.)*;$
# 阻止贪婪
^select \* (.|\n)*?;$
# 匹配单行换行
^\n$
```