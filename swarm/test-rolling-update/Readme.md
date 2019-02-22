
### 测试 Swarm 的滚动升级

#### 测试升级版本号

```
// 先使用 redis 3.0.6 的启动
$ REDIS_VERSION=3.0.6 docker stack deploy -c stack.yml rolling
$ docker service ps rolling_redis
ID                  NAME                IMAGE               NODE                DESIRED STATE       CURRENT STATE            ERROR               PORTS
2kacbusjj7rt        rolling_redis.1     redis:3.0.6         titan               Running             Running 8 seconds ago
vslx6b1yt7r4        rolling_redis.2     redis:3.0.6         server-202          Running             Running 28 seconds ago
t2z6lnssdccr        rolling_redis.3     redis:3.0.6         server-203          Running             Running 32 seconds ago

// 然后使用 redis 3.0.7 进行软件版本号升级
$ REDIS_VERSION=3.0.7 docker stack deploy -c stack.yml rolling
$ docker service ps rolling_redis
ID                  NAME                  IMAGE               NODE                DESIRED STATE       CURRENT STATE                     ERROR               PORTS
ft3t63b85er1        rolling_redis.1       redis:3.0.7         titan               Running             Running 25 seconds ago
2kacbusjj7rt         \_ rolling_redis.1   redis:3.0.6         titan               Shutdown            Shutdown 27 seconds ago
jdomqeql3ne7        rolling_redis.2       redis:3.0.7         server-202          Ready               Assigned less than a second ago
vslx6b1yt7r4         \_ rolling_redis.2   redis:3.0.6         server-202          Shutdown            Running about a minute ago
n74p3nw9pmot        rolling_redis.3       redis:3.0.7         server-203          Running             Running 10 seconds ago
t2z6lnssdccr         \_ rolling_redis.3   redis:3.0.6         server-203          Shutdown            Shutdown 11 seconds ago
```

#### 测试同一个 stack 中的其他服务在不改变配置的情况下，不重新启动服务

```
// 在 stack.yml 中加了 nginx 的配置
$ REDIS_VERSION=3.0.6 docker stack deploy -c stack.yml rolling
$ docker service ps rolling_nginx
ID                  NAME                IMAGE               NODE                DESIRED STATE       CURRENT STATE            ERROR               PORTS
q930wlxgd9ac        rolling_nginx.1     nginx:alpine        server-203          Running             Running 34 seconds ago
n1j8c1rig4qo        rolling_nginx.2     nginx:alpine        server-201          Running             Running 31 seconds ago

$ REDIS_VERSION=3.0.7 docker stack deploy -c stack.yml rolling
$ docker service ps rolling_nginx
ID                  NAME                IMAGE               NODE                DESIRED STATE       CURRENT STATE           ERROR               PORTS
q930wlxgd9ac        rolling_nginx.1     nginx:alpine        server-203          Running             Running 9 minutes ago
n1j8c1rig4qo        rolling_nginx.2     nginx:alpine        server-201          Running             Running 9 minutes ago

// 可见，对 nginx 是没有影响的
```

#### 测试不改变任何配置的情况下，不会重启服务

```
$ REDIS_VERSION=3.0.7 docker stack deploy -c stack.yml rolling
$ docker service ps rolling_nginx
ID                  NAME                IMAGE               NODE                DESIRED STATE       CURRENT STATE            ERROR               PORTS
q930wlxgd9ac        rolling_nginx.1     nginx:alpine        server-203          Running             Running 11 minutes ago
n1j8c1rig4qo        rolling_nginx.2     nginx:alpine        server-201          Running             Running 11 minutes ago

$ docker service ps rolling_redis
ID                  NAME                  IMAGE               NODE                DESIRED STATE       CURRENT STATE             ERROR               PORTS
ft3t63b85er1        rolling_redis.1       redis:3.0.7         titan               Running             Running 10 minutes ago
2kacbusjj7rt         \_ rolling_redis.1   redis:3.0.6         titan               Shutdown            Shutdown 10 minutes ago
jdomqeql3ne7        rolling_redis.2       redis:3.0.7         server-202          Running             Running 9 minutes ago
vslx6b1yt7r4         \_ rolling_redis.2   redis:3.0.6         server-202          Shutdown            Shutdown 9 minutes ago
n74p3nw9pmot        rolling_redis.3       redis:3.0.7         server-203          Running             Running 10 minutes ago
t2z6lnssdccr         \_ rolling_redis.3   redis:3.0.6         server-203          Shutdown            Shutdown 10 minutes ago

// 可见，对服务是没有影响的
```
