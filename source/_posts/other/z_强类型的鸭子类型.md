---
title: 强类型的鸭子类型
date: 2019-07-14 07:04:25
tags: other
categories: other
---

[鸭子类型](https://zh.wikipedia.org/wiki/%E9%B8%AD%E5%AD%90%E7%B1%BB%E5%9E%8B)

`当看到一只鸟走起来像鸭子、游泳起来像鸭子、叫起来也像鸭子，那么这只鸟就可以被称为鸭子。`

<!--more-->

这是一个比较有意思的话题，而且go中接口的特性是golang支持鸭子类型的基础，因为go时强类型语言所以在这里和php做个比照

```php
<?php

class A
{
    public function run()
    {

    }
}

class B
{
    public function run()
    {

    }
}


interface canListen
{
    public function listen();
}


class man implements canListen
{
    public function listen()
    {

        echo 1;
    }
}

class Dvd implements canListen
{
    public function listen()
    {

        return '1';
    }
}

```
A和B都事先了run方法，并且可以放入同一数组中循环调用
man和Dvd都实现了listen并且结成了canListen，但因为canListen没有对返回值做限定所以导致如果你希望让对应的对象给你返回一个字符串，可能并不行


```go
package main

// WhatIsCar as
type WhatIsCar interface {
	run()
	stop()
}

// Car as
type Car struct {
	name string
}

// ACar as
type ACar struct {
	Car
	fly string
}

// CCar as
type CCar struct {
	fly string
}

func (car Car) run() {
	println("Car can run")
}

func (car Car) stop() {
	println("Car can run")
}

func (car ACar) run() {
	println("ACar can run")
}

func (car CCar) run() {
	println("CCar can run")
}

// 当看到一只鸟走起来像鸭子、游泳起来像鸭子、叫起来也像鸭子，那么这只鸟就可以被称为鸭子。
// 因为 go 是静态语言本身具备静态检测，所以鸭子类型带来的负面影响较小
func structTest() {

	var car WhatIsCar
	// car 实现了 whatiscar 的所以方法所以可以使用
	car = new(Car)

	car.run()

	// ACar 继承了 car ,并且重写了run方法 所以也可以使用
	car = new(ACar)

	// CCar 既没有继承 car ，也没有自行实现 whatiscar 的所有方法，没有实现接口，所以不能使用，故注释
	// car = new(CCar)

	car.run()
}
```

这也从一下方面反应了鸭子类型更多的时设计的一种而没有没有明确的好坏之说，相比于不严谨的弱类型代码，强类型的更严谨的约束了鸭子类型，使用上来说也相对安全一点。并且在OO的世界中抽象的角度不同可能得到的结论也不同。
从可能存在的缺陷角度上来说如果使用了鸭子类型，那么尽可能使用鸭子的特征，尽量避免使用非鸭子的特征，比如你让所有的鸭子进了马戏团，但是你又要所有的鸭子去开汽车，但是鸭子的接口没有开汽车这个规定，那么那些不会开车的鸭子就会让你车翻得很严重咯

![](/images/鸭子类型jfif.jfif)