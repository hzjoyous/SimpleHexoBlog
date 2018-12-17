

```bat
:: 端口映射操作
::  sql
ssh -fNg -L [映射端口]:[远程ip]:[远程端口] [username]@[ip]
::  redis
ssh -fNg -L 6379:10.0.2.222:6379 hanzhijie@10.0.2.222
::  memcache
ssh -fNg -L 11211:10.0.2.221:11211 hanzhijie@10.0.2.222


::  order-app-start
start /b php -S localhost:8081 C:\Users\hzj\Desktop\xz\xz_app\public\index.php
::  order-facade-start
start /b php -S localhost:8082 C:\Users\hzj\Desktop\xz\xz_facade\public\index.php

```