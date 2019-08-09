
### 生产环境部署

阿里云生产环境部署

- 获取准备好的服务器 ip 和用户名密码

```
// 假设
S1: 10.10.1.100  test/123456
S2: 10.10.1.111  test/123456
S3: 10.10.1.112  test/123456
...
```

- 选择一台机器作为安装机器，比如选择S1

需要在 S1 上安装 ansible, 教程参考: [官方文档](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

```
// Ubuntu Install Ansible
$ sudo apt update
$ sudo apt install software-properties-common
$ sudo apt-add-repository --yes --update ppa:ansible/ansible
$ sudo apt install ansible
```

- 设置 SSH 免密登录

```
ssh-keygen -t  rsa
ssh-copy-id -i ~/.ssh/id_rsa.pub test@192.168.1.100
```
