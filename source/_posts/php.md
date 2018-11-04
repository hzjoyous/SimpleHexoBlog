---
title: PHP
date: 2018-11-04 15:25:38
---



# php deep 

>  自从安装了wsl 吃嘛嘛香，身体倍棒
> 
tar -cvf phpcs.tar phpcs/*
一致的环境  
- linux 环境
- nginx 版本
- mysql 版本
- php 版本
- composer 版本（这个也很重要）

composer update
composer install
composer update --no-dev


Deployer


# about use

``` php
if ($needBacktrace != 0) {
    ob_start();
    debug_print_backtrace($needBacktrace === 2 ? 1 : 0);
    $trace = ob_get_contents();
    ob_end_clean();
    $msg = $msg . '##  trace:' . $trace;
}

```


