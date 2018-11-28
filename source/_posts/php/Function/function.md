---
title: function
date: 2018-11-28 16:25:59
tags: php
---

```php
<?php
ob_start();
debug_print_backtrace($needBacktrace === 2 ? 1 : 0);
$trace = ob_get_contents();
ob_end_clean();
```
