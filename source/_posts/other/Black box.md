---
title: 黑盒学习
date: 2020-01-30 23:40
tags: other
categories: other
---

*看源码是可以知晓一切*，但是并非最合适使用

下面代码是一段react触发的代码使用的时候**刻意**的打一些log可以更好的了解框架局部的生命周期，辅助理解框架的设计思想。
相比于源码中包含了设计的功能思想和优秀的实现，这些对生命周期设计个人感觉会对项目的设计起巨大帮助和启发

```js
handleLikedClick = () => {
    // 这种方式再react中是不允许的，这种方式会改变数据但是不会改变展示
    // this.state.isLiked = !this.state.isLiked;
    // 要修改数据就是用setState的方法

    // 方法一
    // this.setState({
    //     isLiked: !this.state.isLiked
    // })

    console.log('setstate外部先驱的this.state.isLiked:', this.state.isLiked)
    // 方法二
    this.setState((prevState) => {
        console.log(prevState)
        console.log('setstate内部的this.state.isLiked:', this.state.isLiked)
        return {
            isLiked: !prevState.isLiked
        }
    })
    console.log('setstate外部后续的this.state.isLiked:', this.state.isLiked)

}
```


```
setstate外部先驱的this.state.isLiked: false
index.js:30 setstate外部后续的this.state.isLiked: false
index.js:24 {isLiked: false}
index.js:25 setstate内部的this.state.isLiked: false
```

<!--more-->


