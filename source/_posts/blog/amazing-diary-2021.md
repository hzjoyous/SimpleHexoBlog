---
title: nil
toc: true
date: 2021-01-28 12:06:35
top: 9
tags:
  - other
  - blog
categories:
  - other
thumbnail: https://cdn.jsdelivr.net/gh/hzjoyous/pic-respository/image/20210128/1611838117888.jfif
---

<!-- TOC -->

- [2021](#2021)
	- [02/19](#0219)
	- [02/15](#0215)
	- [01/30](#0130)
	- [01/28](#0128)

<!-- /TOC -->

<!--more-->


# 2021

## 02/19

> 今天晚上可是算blogs好好整理了一波

[欢迎来到超级微小的编译器!](https://github.com/jamiebuilds/the-super-tiny-compiler)

[中文翻译版](https://github.com/YongzeYao/the-super-tiny-compiler-CN)

> 代码作妖记

go 的 `add(1)(2)(3)` 算是写出来了。就是混入了一些奇怪的东西

```go

package main
func main(){
  fmt.Println(add(1,2,3).(func(n ...int) interface{})(1).(func(n ...int) interface{})(2).(func(n ...int) interface{})().(int))
}

func add(n ...int) interface{} {
	if len(n)==1 {
		return n[0]
	} else {
		sum:=0
		for _,value:=range n{
			sum+=value
		}
		return func(newN...int) interface {}{
			newN = append(newN,sum)
			return add(newN...)
		}
	}
}
```

## 02/15

嚯，今天用[https://github.com/oxequa/realize](https://github.com/oxequa/realize),这个工具可真是一波三折，`go get` 后提示依赖有问题，issue里面有人也提出这个问题，是关闭GO111MODULE,反正我用了，还是无效，他的那个依赖在 `gopkg.in`直接打开地址也是404，最后还是对master的代码`git clone`+`go install`一把梭。不过看了本地的许多包，好像都是把所有的tag都拉取下来了。不知道这个设计的摸底是为了啥。
问题解决了，很好。

## 01/30
> 只有记性好的人才会记得自己忘记了什么，而记性差的人是不记得自己忘记了什么

## 01/28

> 下午好困

picgo感觉很不稳定，与其在picgo的基础基于github上做一个图库，倒不如直接本地用单文件做一个web服务进行更全面的管理。定制化更高。个人使用的话，应该不会超过1w张图吧。过去qq空间的图片乱七八糟拍了很多年的数量估计。数量应该不会有巨大影响。

> 多则惑少则得
 
今天上午整理了一下之前的博客，因为都是断断续续写的，所以比较零散。有的也比较重复文章太多导致有些时候查找起来不是很方便，有些分类已经随着各种零散记录的增加变得不再合。所以做了一些合并，整理成了 **how to use** 这个分类，当然以后其他的记录可能会变成篇少字多方便查阅。

y~~
![how_to_use](https://cdn.jsdelivr.net/gh/hzjoyous/pic-respository/image/20210128/1611838098704.png)
