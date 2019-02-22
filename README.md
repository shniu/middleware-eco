# Docker

Contains all docker related stuff

> https://12factor.net/

### health check

- [health check lib](https://github.com/docker-library/healthcheck)


### Docker related

- [Understanding Docker Build Args, Environment Variables and Docker Compose Variables](https://vsupalov.com/docker-env-vars/)

Let’s do a deep dive and get an overview of all the possible ways to use variables while creating and running Docker containers.

```
// 使用 docker inspect 可以查看镜像的 Env 配置
docker inspect <image id>
```
相关链接
1. [Docker docs builder arg](https://docs.docker.com/engine/reference/builder/#arg)
2. [Docker docs docker compose arg](https://docs.docker.com/compose/compose-file/#args)
3. [Docker docs environment var](https://docs.docker.com/engine/reference/builder/#environment-replacement)
4. [Docker docs env variables](https://docs.docker.com/engine/reference/run/#env-environment-variables)
5. [Docker docs env file](https://docs.docker.com/compose/compose-file/#env_file)

- [.dockerignore file](https://docs.docker.com/engine/reference/builder/#.dockerignore-file)

- [What's Wrong With The Docker :latest Tag?](https://vsupalov.com/docker-latest-tag/)

Let’s go over the most frequent misconceptions and ways in which the :latest tag can cause suffering - and how to avoid the :latest pain.

## 官方 Samples

1. [Docker 官方 samples](https://docs.docker.com/samples/)
2. [Docker labs](https://github.com/docker/labs)
