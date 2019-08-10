
### 生产环境部署

阿里云生产环境部署, ansible 脚本参考 `middleware-eco/ansible/sample`

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

使用 ansible playbook 实现批量的免密登录设置

```
// 生成公私钥
ssh-keygen -t  rsa
```

1. 需要安装 sshpass 程序 `apt-get install sshpass`, [参考这里](https://gist.github.com/arunoda/7790979), 装不上的话就用源码安装
2. 第一次连接的时候需要检查private key，可以 `export ANSIBLE_HOST_KEY_CHECKING=False`
3. 使用 ansible 的 authorized_key 模块

```
// 下面的命令的主要作用是：
//   1. 第一次执行时不检查ssh private key
//   2. authorized_key 相当于批量执行 ssh-copy-id -i ~/.ssh/id_rsa.pub test@192.168.1.100
//   3. --ask-pass 提示输入ssh的密码，这么做安全一些
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory --ask-pass main.yml
```
