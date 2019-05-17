
mysql -u root -p 
CREATE USER “test”@”localhost” IDENTIFIED BY “1234”; #本地登录 
CREATE USER “test”@”%” IDENTIFIED BY “1234”; #远程登录 
quit 
mysql -utest -p #测试是否创建成功

create database testDB default charset utf8 collate utf8_general_ci;

grant all privileges on testDB.* to “test”@”localhost” identified by “1234”; 
flush privileges; #刷新系统权限表

grant select,update on testDB.* to “test”@”localhost” identified by “1234”; 
flush privileges; #刷新系统权限表

mysql -u root -p 
Delete FROM mysql.user Where User=”test” and Host=”localhost”; 
flush privileges; 
drop database testDB;

grant select,delete,update,create,drop on . to test@”%” identified by “1234”; #”%” 表示对所有非本地主机授权，不包括localhost


mysql -u root -p 
update mysql.user set authentication_string=password(“新密码”) where User=”test” and Host=”localhost”; 
flush privileges;
