
```
# Terminal 1
COMPOSE_PROJECT_NAME=zk_test docker-compose up

# Terminal 2
COMPOSE_PROJECT_NAME=zk_test docker-compose ps

# 使用 Docker 命令行客户端连接 ZK 集群
docker run -it --rm \
        --link zoo1:zk1 \
        --link zoo2:zk2 \
        --link zoo3:zk3 \
        --net zktest_default \
        zookeeper zkCli.sh -server zk1:2181,zk2:2181,zk3:2181

# 通过本地主机连接 ZK 集群

zkCli.sh -server localhost:2181,localhost:2182,localhost:2183

# 查看集群
通过 nc 命令连接到指定的 ZK 服务器, 然后发送 stat 可以查看 ZK 服务的状态, 例如:

echo stat | nc 127.0.0.1 2181

echo stat | nc 127.0.0.1 2182



```
