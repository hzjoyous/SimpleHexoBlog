---
title: spring
date: 2018-12-18 00:10:45
tags: 
- spring
- java
---

# 了解spring



今天安装了一下 spring cloud 并且运行得到了'hello world'，从第一个'hellow world'，到最中的spring cloud的开发过程和实现原理吧

[官网文档](https://docs.spring.io/spring-boot/docs/2.1.1.RELEASE/reference/htmlsingle/#boot-documentation)  
先说一种（可以忽略这个） [spring 下载路径](https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/2.1.1.RELEASE/spring-boot-cli-2.1.1.RELEASE-bin.zip), 下载后使用目录bin下的spring.bat,可以运行简单的‘hello world’，由于没有采用任何依赖管理工具，就跳过这个详细讲解

## 正篇

> 使用linux 和 xos 的童鞋自己去官网文档看下安装教程哦，这里稍微加入点 windows 的安装过程

使用 windows 的同学可以先安装一个 [chocolatey](https://chocolatey.org/install)，这个工具是 windows 上的包管理工具，类似于 linux 上的 apt-get、yum ，使用 choco 也可以安装一些例如 notepad++ 这样的软件，感兴趣的童鞋可以自己试一下

使用 choco 安装 maven
```bat
choco install maven
```

首先创建一个 pom.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>

	<groupId>com.example</groupId>
	<artifactId>myproject</artifactId>
	<version>0.0.1-SNAPSHOT</version>

	<!-- Inherit defaults from Spring Boot -->
	<parent>
		<groupId>org.springframework.boot</groupId>
		<artifactId>spring-boot-starter-parent</artifactId>
		<version>2.1.1.RELEASE</version>
	</parent>

	<!-- Add typical dependencies for a web application -->
	<dependencies>
		<dependency>
			<groupId>org.springframework.boot</groupId>
			<artifactId>spring-boot-starter-web</artifactId>
		</dependency>
	</dependencies>

	<!-- Package as an executable jar -->
	<build>
		<plugins>
			<plugin>
				<groupId>org.springframework.boot</groupId>
				<artifactId>spring-boot-maven-plugin</artifactId>
			</plugin>
		</plugins>
	</build>

</project>
```

这个文件给我的第一感觉有点类似于 php 的 composer （php 的包管理工具），略有不同的是 maven 引入到了本地仓库，而不是当前路径下创建一个文件存放，这个和 php 包管理就略有不同 ，在 windows 下 maven 引入的文件会默认导入到用户目录下的 .m2 文件夹下的，其中这个 .m2 的路径配置是 Maven 安装目录下的 config 中的 setting.xml。

创建一个 java 文件，位于项目根目录下 src/main/java/Example.java，接下来可以执行一下命令，然后访问 localhost:8080, 至此第一个 spring 程序就跑起来了

```.bat
# 查看
mvn dependency:tree
# 第一种运行方式
mvn package
java -jar target/myproject-0.0.1-SNAPSHOT.jar
# 第二种运行方式
mvn spring-boot:run
```