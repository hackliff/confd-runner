var koa = require('koa');
var conf = require('/tmp/myconfig.conf');
var app = koa();

app.use(function *() {
  this.body = conf.msg;
});

app.listen(conf.port);
