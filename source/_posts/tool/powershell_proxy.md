---
title: powershell_proxy
date: 2020-07-09 12:13:02
tags: other
categories: other
---


```
git config --global http.proxy http://127.0.0.1:11000
git config --global https.proxy http://127.0.0.1:11000

git config --global --unset http.proxy
git config --global --unset https.proxy
```

```
set http_proxy=http://127.0.0.1:11000
set https_proxy=http://127.0.0.1:11000

set http_proxy=socks5://127.0.0.1:10010
set https_proxy=socks5://127.0.0.1:10010


set http_proxy=
set https_proxy=


set http_proxy_user=user
set http_proxy_pass=pass

set https_proxy_user=user
set https_proxy_pass=pass

# 恢复
set http_proxy=
set https_proxy=
# Ubuntu 下命令为 export
# export http_proxy=http://127.0.0.1:11000
```

<!--more-->


