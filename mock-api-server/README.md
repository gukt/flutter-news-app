这是为新闻 APP 写的一个模拟 API 服务，用的是 Python 的 Flask 和 Faker 模块编写。

你可以在 VS Code 中运行该 API 服务，也可以独立运行它们。

如果你想在本地独立运行 API 服务，或将其部署到外网服务器，请参考如下文档。

# Quick Start

首先，进入 mock-api-server 目录。

```bash
$ cd mock-api-server
```

创建 Python 虚拟环境。

```bash
$ python3 -m venv .
```

接着，激活虚拟环境。

```bash
$ source bin/activate
```

安装相关依赖。

```bash
$ pip3 install flask flask_cors faker
```

现在就可以启动服务了。

```bash
$ flask run
 * Serving Flask app 'app' (lazy loading)
 * Environment: development
 * Debug mode: on
 * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 405-914-804
```

检查服务是否正常。

```bash
$ curl 127.0.0.1:5000
It works.
```

当看到控制台输出 `It works`，就表示运行成功了。

# 📢 注意事项

默认是以 `debug` 模式运行的。其他模式还有：`development`、`production`。

如果想改为其他模式，运行 `flask run` 之前先设定环境变量。

```bash
$ export FLASK_ENV=development
$ flash run
```

**注意：** 服务默认监听在 `127.0.0.1` 这个 `lookback` 地址上，在真机调试时是连不上的。如果你需要真机调试时可访问，需要在启动时指定 `--host` 参数。

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

如果你希望将程序部署在外网服务器，请将 `host` 指定为 `0.0.0.0`，它表示监听本地所有地址。

**注意：** 如果真机调试仍然连不上，请检查访问地址是否与该上述监听的地址在同一网段内。

默认端口是 `5000`，如果你需要更改端口，请使用 `--port` 参数。

```bash
$ flask run --host=0.0.0.0 --port 8080
```

（完）
