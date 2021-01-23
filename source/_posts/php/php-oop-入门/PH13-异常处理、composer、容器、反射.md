---
title: 'PHP[OOP入门]PH13-异常处理、composer、容器、反射'
date: '2017-01-01T09:02:13+08:00'
tags:
    - php
categories:
    - php

---



> 该部分为 php 面向对象的入门部分，较为肤浅且参杂过分已经不是主流的知识。

> 这是我早期的 php 学习笔记，php 的学习版本版本是 5.6、7，🐟2020/05/06年从有道笔记导出至此。


day13-异常处理、composer、容器、反射

1、异常处理

做两手准备（planA planB）

生活中

代码中

正常的逻辑，代码会按照你写的顺序正常的往下执行，在执行的过程中，往往会有一些异常的情况，碰到异常的情况，我们应该如何应对呢，这就是异常处理

在php中：try catch
Exception(异常类，所有异常处理类的基类)，在代码中如果有异常了，我们要手动抛出异常

try:尝试着去执行一些有异常情况的代码，如果出现异常，手动抛出

throw:抛出异常

catch:捕获异常，进行下一步处理

【注】try-catch是一种结构，一个try至少对应一个catch

【注】在try和catch之间不能有任何的代码

try {

} catch () {

}

执行流程：

程序首先执行try中的代码，如果碰到了throw，那么try里面的throw下面的代码将不再执行，直接被catch捕获到这个异常，在catch中再执行你想执行的流程

Exception：官方的异常处理类，是所有异常类的基类

构造方法：错误信息，错误代码

getMessage

getCode

自定义异常处理类:一定要继承自官方异常处理类

final:

类：代表此类不能被继承

方法：代表这个方法不能被重写

多个捕获

【注】如果是多个捕获，那么自定义的异常处理捕获要放到官方捕获的上面

嵌套

见代码

自定义异常处理函数

set\_exception\_handler(\'exceptionHandle\');

注册一个函数用来处理异常信息

2、composer

打开openssl扩展

如果安装成功，在cmd下输入composer，敲回车，显示出来即安装成功

基本dos指令

cd 拖过来你的那个项目文件夹

dir 显示当前文件夹下面所有的文件

composer.json文件

编写该文件,这个文件就是你的composer的配置文件，你想安装的一些包的信息都要写到这个文件中，而且按照固定的格式写（json格式）

{

\"employees\": \[

{ \"firstName\":\"Bill\" , \"lastName\":\"Gates\" },

{ \"firstName\":\"George\" , \"lastName\":\"Bush\" },

{ \"firstName\":\"Thomas\" , \"lastName\":\"Carter\" }

\]

}

json格式：两种数据类型 对象{} 数组\[\]
键使用双引号引起来，键值对中间使用逗号隔开

修改为国内镜像网

github.com

packagist.org

https://pkg.phpcomposer.com/ 国内镜像

只要你安装了composer，默认是从国外镜像下载，你得修改成国内镜像，否则后果自负

执行如下指令，修改镜像源

composer config -g repo.packagist composer
https://packagist.phpcomposer.com

require加载路由包

\"require\": {

\"noahbuscher/macaw\": \"dev-master\"

}

运行composer update指令进行下载

版本号

1.0.\* 表示任何从 1.0 开始的开发分支，它将会匹配 1.0.0、1.0.2 或者
1.0.20

1.0.2 对应确定的版本号

\>=1.0

\>=1.0,\<2.0

\>=1.0,\<1.1\|\>=1.2

\~1.2 相当于 \>=1.2,\<2.0

\~1.2.3 相当于 \>=1.2.3,\<1.3

dev-master github上面的主版本号

参数

项目基本描述

\"name\": \"laravel/laravel\",

\"description\": \"The Laravel Framework.\",

\"keywords\": \[\"framework\", \"laravel\"\],

\"license\": \"MIT\",

\"type\": \"project\",

autoload(重点)

通过composer安装的包，composer都已经为我们实现了自动加载，使用的时候，直接使用即可

【注】使用第三方包之前，要首先包含

include \'vendor/autoload.php\';

如果是自己写的类，想用通过自动加载加载过来，需要使用下面两种方法中的任意一种

psr-4 ：遵从psr-4的规范进行加载

classmap：文件夹映射，将该文件夹下面的所有文件包含进来

【注】修改完配置文件中的autoload参数之后，要首先执行 composer
dump-autoload

composer常用指令

通过composer list来展示所有的指令

require 安装包我们可以通过配置文件来进行加载，也可以通过指令模式进行加载

composer require noahbuscher/macaw:dev-master

3、依赖注入（DI）、反转控制（IOC）、容器

容器优点：

1、降低耦合度

2、实现惰性加载

3、便于管理

4、反射

ReflectionClass 反射类对象

ReflectionMethod 反射方法对象

ReflectionParameters 反射参数对象

5、虚拟主机

httpd.conf

vhost\_alias\_module

rewrite\_module

Include conf/extra/httpd-vhosts.conf
