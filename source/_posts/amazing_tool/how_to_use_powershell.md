---
title: 'powershell & linux bash'
date: '2020-05-22T06:27:46+08:00'
tags:
    - tool
    - powershell
    - bash
categories:
    - HowToUse

---

<!-- TOC -->

- [pwsh docs 地址](#pwsh-docs-地址)
- [pwsh vs bash](#pwsh-vs-bash)
- [my profile](#my-profile)
- [other](#other)

<!-- /TOC -->

> PowerShell 是构建于 .NET 上基于任务的命令行 shell 和脚本语言。 PowerShell 可帮助系统管理员和高级用户快速自动执行用于管理操作系统（Linux、macOS 和 Windows）和流程的任务。

# pwsh docs 地址

[pwsh docs](https://docs.microsoft.com/zh-cn/powershell/scripting/overview?view=powershell-7)

# pwsh vs bash
| pwsh                                                       | bash                       |
| ---------------------------------------------------------- | -------------------------- |
| `Start-Job -ScriptBlock {hexo s}`                          | `hexo s &`                 |
| `get-job` `remove-job` `Receive-Job` `stop-job` `wait-job` | unknow                     |
| `[command1] ; [command2]`                                  | `[command1] ; [command2]`  |
| `try{[command1] ; [command2]} catch{$error[0];break}`      | `[command1] && [command2]` |
| `[command1] \| [command2]`                                 | `[command1] \| [command2]` |
| `[command1] > 1.txt`                                       | `[command1] > 1.txt`       |
| `[command1] >> 1.txt`                                      | `[command1] >> 1.txt`      |


<!--more-->


# my profile

普通用户下执行`$profile`以获取启动脚本路径`powershell 需要在管理员权限下执行 set-executionpolicy remotesigned 以使用自建脚本` ，等价`~/.bashrc`

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
    code $PROFILE
}

function zwhichis($command){
    cmd /c where $command
}

$startUpPath = 'C:\Users\HZJ\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup';
function echoStartUpPath {
    $startUpPath;
}

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

```

# other


```bat
:: 端口映射操作
::  sql
ssh -fNg -L [映射端口]:[远程ip]:[远程端口] [username]@[ip]
::  redis
ssh -fNg -L 6379:10.0.2.222:6379 hanzhijie@10.0.2.222
::  memcache
ssh -fNg -L 11211:10.0.2.221:11211 hanzhijie@10.0.2.222

::  order-app-start
start /b php -S localhost:8081 C:\Users\username\Desktop\xz\xz_app\public\index.php
::  order-facade-start
start /b php -S localhost:8082 C:\Users\username\Desktop\xz\xz_facade\public\index.php
```