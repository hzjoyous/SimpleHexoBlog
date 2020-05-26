---
title: code
date: 2020-04-12 16:07:20
tags: other
categories: other
---

## value

### php
```php
$value = 'value';
$value = 123;
```
### js
```js
let value='value';
const value = 'value';
var value = 'value';
```
### go
```go
const  VALUE int = 10
var value int = 10
value :=10
const a4, b4, c4 = 1, false, "str" 
```
### python
```py
value = 1
```

<!--more-->

## function

### php

```php
//
function func(){

}
$value1 = 1;
$value2 = 2;
$func2 = function($p)use($value1,&$value2){
return ;
}

```

### js

```js
function func(){

}
value =1;
func2= function(p){
value;
}
```

### go

```go
func funcName(p int,arr []int) int{
return 1
}

func add(x1, x2 int) func(x3 int, x4 int) (int, int, int) {
	i := 0
	return func(x3 int, x4 int) (int, int, int) {
		i++
		return i, x1 + x2, x3 + x4
	}
}
```

参考

```php
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

### python

```py
def func()
    return 
def func1():
    def func():
        return 1
    return func

func2 = func1()
print(func2)

```

## Class

### php
### js
### go
### python


## Other

### php

```php
$arr = 1;

```

### js
### go
### python
