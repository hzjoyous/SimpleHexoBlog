---
title: 从更换辅助工具谈寻找轮子的思路
date: 2020-01-19 15:26:00
tags: other
categories: other
---

之前由于用不惯hexo自带的生成文章的方式于是单独写了个php文件辅助生成，由于写的比较匆忙导致也有些bug。时间推移就想改进以下，因为不想在hexo中大量引入php，于是决定废弃这个项目中的php运行文件。（个人看法是不希望php项目中夹杂node工具，node项目中也不要夹杂php工具，这样容易使项目所有功能都跑起来依赖的基建比较多，增加别人参考的成本）

<!--more-->


这里先放上之前的php脚本

phelper.php 里面主要部分就是创建文件夹，创建默认文件，日期，和用vscode唤起

```php
<?php

$blogPath = __DIR__ . DIRECTORY_SEPARATOR . 'source' . DIRECTORY_SEPARATOR . '_posts' . DIRECTORY_SEPARATOR;

if (isset($argv[1]) && isset($argv[2])) {
    $blogName = $argv[2];
    $blogNamespace = $argv[1];
} else if (isset($argv[1])) {
    $blogName = $argv[1];
    $blogNamespace = 'other';
} else {
    $blogName = date('Y_m_d') . "杂谈";
    $blogNamespace = 'other';
}

$createTime = date('Y-m-d H:i:s');



$content = "---\n";
$content .= "title: " . $blogName . "\n";
$content .= "date: " . $createTime . "\n";
$content .= "tags: " . 'other' . "\n";
$content .= "categories: " . 'other' . "\n";
$content .= "---\n";
$content .= "

<!--more-->

";
$newBlogFilePath =  $blogPath . DIRECTORY_SEPARATOR . $blogNamespace . DIRECTORY_SEPARATOR . 'z_' . $blogName . '.md';
if (file_exists($newBlogFilePath) == 1) {
    $newBlogFilePath =  $blogPath . DIRECTORY_SEPARATOR . $blogNamespace . DIRECTORY_SEPARATOR . 'z_' . $blogName . time() . '.md';
}



file_put_contents($newBlogFilePath, $content, 8);
echo realpath($newBlogFilePath);
echo PHP_EOL;

exec('code '.$newBlogFilePath);
```

如果我继续使用php编写cli脚本的话，我可能就会期望选用 symfony/console 来定制我需要的交互式命令，因为决定不使用php，所以我需要在npm中寻找对应的包，**毕竟都不是新型语言，所以在这种辅助类工具开发上，一旦需求变高，找轮子要优于造轮子**，首先我在[npm](https://www.npmjs.com/)中搜索command和console,但是结果显示的包更新日期都比在数个月以上了。所以决定更换查找方式。于是决定先参考以下vue-cli引用了类似的包，这里用的everything进行的查询

![EveryThing搜索结果](/images/2020/未命名1579419556.png)

打开该目录，进入bin文件夹下打开vue（win下可执行文件都是.exe后缀，直接可运行的脚本大多都是.bat然后驱动一个其他脚本语言的脚本，所以这个文件大概率就是个node编写的脚本）

打开bin/vue

```
#!/usr/bin/env node

const program = require('commander')

program
  .version(require('../package').version)
  .usage('<command> [options]')
  .command('init', 'generate a new project from a template')
  .command('list', 'list available official templates')
  .command('build', 'prototype a new project')
  .command('create', '(for v3 warning only)')

program.parse(process.argv)
```

这个文件中引入了commander，于是我们可以去npm查以下这个包，查询结果

![npm中commander查询结果](/images/2020/QQ截图20200119154714.png)

最后一次更新也比较近（虽然这不是评价一个包好坏的标准）。

进入文档查询。然后就比较失望了，这个commander只提供了参数式的使用方式并没有提供交互式的cli方式。所以并不满足我的需求。

下一步直接查询`node 交互式cli`，然后在第一个结果中看到有人指出了inquirer，chalk这两个包，接下来又到知乎逛了以下，了解了以下inquirer和commander，基本确认inquirer、chalk、commander这三个包是我需要的扩展。也比较主流，只是觉得并不像symfony/console对控制台提供的那样全面一些吧，symfony/console提供了参数式、交互式及一定程度的美化、也提供了一些进度条呀，table之类的展示方式。感觉未来node的这三个包也会被其他开发整合到一起来使用。


