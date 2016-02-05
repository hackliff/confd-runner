# Application Configuration Hot-Reloading

> Centralize applications' configuration and hot-reload them on changes.


## Getting started

Given the simple server application in `app.js`, one can deploy it following the steps below.

```Bash
$ # install confd
$ ./bootstrap-confd.sh

$ # copy the configuration template
$ cp ./conf.js.tmpl /etc/confd/templates/sample.conf.tmpl

$ # tell confd how to process
$ cp confd.toml /etc/confd/confd/sample.toml
```

## Deploy

```Bash
$ # start redis, the configuration storage
$ redis-server &

$ # set initial configuration
$ redis-cli set /sample/api/port 3000
OK
$ redis-cli set /sample/api/msg "hello world"
OK

$ # start the app and watch for configuration changes
$ confd -backend redis -node localhost:6379 -interval 1
2016-02-05T11:30:44Z 1243d71ff9e2 confd[19]: INFO Target config /tmp/myconfig.conf out of sync
2016-02-05T11:30:44Z 1243d71ff9e2 confd[19]: INFO Target config /tmp/myconfig.conf has been updated
2016-02-05T11:30:58Z 1243d71ff9e2 confd[19]: INFO /tmp/myconfig.conf has md5sum 7ee694b41e0cda8d6ce2b31dc1bf58df should be 769f04adc7994bfb9a7a853c16548d23
```
