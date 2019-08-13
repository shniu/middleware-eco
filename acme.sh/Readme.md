

# 参考资料

> acme.sh docker image
> https://store.docker.com/community/images/neilpang/acme.sh

> acme.sh 中文说明
> https://github.com/Neilpang/acme.sh/wiki/%E8%AF%B4%E6%98%8E

> Use Aliyun domain API to automatically issue cert
> https://github.com/Neilpang/acme.sh/tree/master/dnsapi#11-use-aliyun-domain-api-to-automatically-issue-cert

> Run acme.sh in docker
> https://github.com/Neilpang/acme.sh/wiki/Run-acme.sh-in-docker

# 初始获取 Let's Encrypt 证书

1. 创建 /mnt/docker/acme.sh/ 目录。

2. 执行命令获取证书：
```
docker run -it --rm \
--env Ali_Key=<key> \
--env Ali_Secret=<secert> \
-v /mnt/docker/acme.sh:/acme.sh \
neilpang/acme.sh \
--issue \
--dns dns_ali \
-d epuchain.com \
-d *.epuchain.com
```

# 把证书安装到指定位置
```
docker run -it --rm \
-v /mnt/docker/acme.sh:/acme.sh \
-v /mnt/docker/sites/config:/certs \
neilpang/acme.sh \
--install-cert \
-d epuchain.com \
--key-file /certs/epuchain.com.key \
--fullchain-file /certs/epuchain.com.cer
```

# 利用 Cron Job 来定期更新 Let's Encrypt 证书

前面步骤中输入的 Ali_Key/Ali_Secret 以及证书安装位置等已经被记录在配置文件中了，
更新证书时不再需要重复输入，只要映射到正确的目录即可。

执行 crontab -e 命令，并输入下面的内容（该任务会自动安装在 /var/spool/cron/root 中）：
```
MAILTO=""
10 5 * * * docker run --rm -v /mnt/docker/acme.sh:/acme.sh -v /mnt/docker/sites/config:/certs neilpang/acme.sh --renew-all && docker restart app-server
```

## Other

- https://github.com/Valian/docker-nginx-auto-ssl
- https://github.com/nickjj/ansible-acme-sh
