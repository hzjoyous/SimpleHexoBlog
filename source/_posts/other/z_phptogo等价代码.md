---
title: phptogo等价代码
date: '2019-07-11T02:28:13+08:00'
tags:
    - other
categories:
    - other

---



php 和 go 的等价代码参考

<!--more-->
```php
```
- 闭包
```php
<?php
function add(int $x1,int $x2) {
	$i=1;
	return function (int $x3,int $x4) use ($x1,$x2,&$i){
        var_dump($i);
        $i++;
        var_dump($i);
		return [$i,$x1+$x2,$x3+$x4];
	};
}
```

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
