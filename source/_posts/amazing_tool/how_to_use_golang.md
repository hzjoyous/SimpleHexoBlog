---
title: how to use golang
toc: true
date: 2021-01-27 10:02:08
thumbnail: https://cdn.jsdelivr.net/gh/removeif/blog_image/img/2019/20190919221611.png
tags:
  - other
  - blog
categories:
  - other

---



<!--more-->


# go get 代理设置

- 对应的shell代理设置，cmd/powershell
- git代理设置
  
```
set http_proxy=http://127.0.0.1:1081
set https_proxy=http://127.0.0.1:1081
$ENV:http_proxy="http://127.0.0.1:1081"
$ENV:https_proxy="http://127.0.0.1:1081"
git config --global http.proxy http://127.0.0.1:1081
git config --global https.proxy http://127.0.0.1:1081
git config --global --unset http.proxy
git config --global --unset https.proxy
```


## go闭包练习
```go
package main 
func add(x1, x2 int) func(x3 int, x4 int) (int, int, int) {
	i := 0
	return func(x3 int, x4 int) (int, int, int) {
		i++
		return i, x1 + x2, x3 + x4
	}
}
```