
### 使用mysql docker客户端导入数据

```
// clone employees repository
git clone https://github.com/datacharmer/test_db.git
cd test_db

// 使用 mysql 导入
docker run -it -v /Users/shniu/git/github/test_db:/sql arey/mysql-client -h 10.1.0.176 -P 3306 -u root --password -e "source /sql/employees.sql"

// 查看表结构
docker run -it arey/mysql-client -h 10.1.0.176 -P 3306 -u root --password -e "use employees;show tables;"

// 导入数据
docker run -it -v /Users/shniu/git/github/test_db:/sql arey/mysql-client -h 10.1.0.176 -P 3306 -u root --password -D employees -e "source /sql/load_departments.dump;source /sql/load_employees.dump ;source /sql/load_dept_emp.dump ;source /sql/load_dept_manager.dump ;source /sql/load_titles.dump ;source /sql/load_salaries1.dump ;source /sql/load_salaries2.dump ;source /sql/load_salaries3.dump ;source /sql/show_elapsed.sql ;"
```

### 使用 mysql docker 客户端

```
// 以交互模式启动，进入到mysql的控制台
$ docker run -it -v /Users/shniu/git/github/test_db:/sql arey/mysql-client -h 10.1.0.176 -P 3306 -u root --password

// 使用docker的交互模式进入mysql client
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                                                  NAMES
1d43b3e6c56f        arey/mysql-client   "mysql -h 10.1.0.176…"   8 seconds ago       Up 6 seconds                                                               blissful_sanderson

$ docker exec -it blissful_sanderson /bin/sh
```
