---
title: http与websocket端口共享
date: '2019-07-15T15:11:06+08:00'
tags:
    - other
categories:
    - other

---



Q:为什么 Socket.IO 可以让 WebSockets 和 HTTP 监听在同一端口

A:websocket, http 都是基于tcp实现的。websocket 的连接请求都是用的http。websocket和http是在一个层面上的东西

<!--more-->


微信的web客户端使用的是http keep-alive 进行数据的接受蛮有意思的。

日后填坑。