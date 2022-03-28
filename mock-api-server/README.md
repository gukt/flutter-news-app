# 使用手册

## 如何运行 Mock API 服务?

首先，需要激活 python 虚拟环境：

```bash
$ cd <path-to-mock-api>
$ source bin/active
```

激活后，启动 API Web 服务：

```bash
$ flask run
```

启动成功后，通过 http://127.0.0.1:5000/ 访问 API 接口。

> 请注意：服务默认监听在 127.0.0.1 这个 lookback 地址上，在真机调试时是连不上的。

真机调试时，启动时需要加上 `host` 参数：

```bash
$ flask run --host=0.0.0.0
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: off
 * Running on all addresses.
   WARNING: This is a development server. Do not use it in a production deployment.
 * Running on http://192.168.1.7:5000/ (Press CTRL+C to quit)
```

NOTE：别忘了，将 APP 里的 API 接口地址前缀改为上面显示的地址。

如果真机调试连不上，请检查是否在同一个网段。

Cheers!!! 🍺🍺🍺

（完）
