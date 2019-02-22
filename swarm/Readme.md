
### Simple management UI for Docker 

> https://github.com/portainer/portainer

- [Deployment the portainer](https://portainer.readthedocs.io/en/latest/deployment.html)
- [Using the Portainer Agent](https://www.portainer.io/2018/10/using-portainer-agent/)

```
# Deployment
sudo docker stack deploy --compose-file=portainer-agent-stack.yml portainer

# Have a look
sudo docker service ls
```

### Rolling update

- [Rolling updates with Docker Swarm](https://container-solutions.com/rolling-updates-with-docker-swarm/)
- [Zero Downtime Deployment with Docker Rolling Updates](https://blog.capstonec.com/2018/06/28/zero-downtime-deployment-with-docker-rolling-updates/)

- [Zero-downtime deployments with rolling upgrades](https://github.com/moby/moby/issues/30321)

这个是有关使用滚动更新进行零宕机部署的讨论

- [Zero Downtime Deployment with Docker Stack and Spring Boot](https://www.gesellix.net/post/zero-downtime-deployment-with-docker-stack-and-spring-boot/)

[gesellix/graceful-shutdown-spring-boot](https://github.com/gesellix/graceful-shutdown-spring-boot)
