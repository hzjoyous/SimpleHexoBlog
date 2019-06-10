---
title: cmd & powerShell & bash
date: 2019-06-10 15:25:38
tags: 
- tool
- command
categories: tool
---

普通用户下执行`$profile`以获取启动脚本路径
`powershell 需要在管理员权限下执行 set-executionpolicy remotesigned 以使用自建脚本` ，等价`~/.bashrc`

```ps1
function hexocgd{
    hexo clean; hexo g; hexo d;
}
function hexogd{
    hexo g; hexo d;
}
function workspace{
    Set-Location D:\workSpace\hexo;
}
function editpspre{
    code C:\Users\HZJ\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1;
}
```

| cmd | PowerShell                                             | linux-bash                  | desc   |
|-----|--------------------------------------------------------|-----------------------------|--------|
| cd  | cd                                                     | cd                          |        |
|     | `[command1] ; [command2\]`                             | `[command1] ; [command2\]`  |        |
|     | `try{[command1] ; [command2\]} catch{$error[0];break}` | `[command1] && [command2\]` |        |
|     | `[command1] | [command2]`                              | `[command1] | [command2]`   | 管道   |
|     | `[command1] > 1.txt`                                   | `[command1] > 1.txt`        | 重定向 |
|     | `[command1] >> 1.txt`                                  | `[command1] >> 1.txt`       | 重定向 |



```bat
:: 端口映射操作
::  sql
ssh -fNg -L [映射端口]:[远程ip]:[远程端口] [username]@[ip]
::  redis
ssh -fNg -L 6379:10.0.2.222:6379 hanzhijie@10.0.2.222
::  memcache
ssh -fNg -L 11211:10.0.2.221:11211 hanzhijie@10.0.2.222


::  order-app-start
start /b php -S localhost:8081 C:\Users\hzj\Desktop\xz\xz_app\public\index.php
::  order-facade-start
start /b php -S localhost:8082 C:\Users\hzj\Desktop\xz\xz_facade\public\index.php
```