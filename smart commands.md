
## Smart command for Docker

- 镜像相关的命令

```shell

// 查看镜像列表
sudo docker images

// 删除镜像
sudo docker rmi <image name>

// 批量删除 none 镜像
sudo docker images|grep none|awk '{print $3 }'|xargs sudo docker rmi
```

- 容器相关

```shell

// 查看容器
sudo docker ps
sudo docker ps -a
sudo docker ps -qa

// 批量删除容器
sudo docker ps -a|grep rancher|awk '{print $1 }'|xargs sudo docker rm
```
