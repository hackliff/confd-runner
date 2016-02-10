# Application Configuration Hot-Reloading

This demo project deploys a simple Nodejs server but experiments a
modern approach for application configuration.

- Parameters are stored in a central key/value database (redis, consul, ...)
- Any change generates a new configuration file from those data
- And make the depending process to restart


## Getting started

```Bash
$ # build application container
$ docker-compose build

$ docker exec -it confdrunner_redis_1 redis-cli set /sample/api/port 3000
$ docker exec -it confdrunner_redis_1 redis-cli set /sample/api/msg hello

$ docker-compose up -d
```
