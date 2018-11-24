#!/bin/bash

#将如果需要postgres以外的数据库用户连接，请将该文件覆盖到/var/lib/postgresql/data目录下(注：目前只允许postgres连接)
cp /tmp/pg_hba.conf /var/lib/postgresql/data
#切换为postgres
su postgres
#创建innode实例
createdb innode -U postgres -E UTF8 -e
#创建innodb用户
psql -d postgres -U postgres -c "CREATE USER innodb WITH PASSWORD '888888'"
#给innodb用户授予innode实例权限
psql -d postgres -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE innode to innodb"
#导入基础数据操作,数据库用户postgres据应用外部配置文件所指定的用户修改，基础数据包innode-20181019null.sql据实际修改
psql -d innode -U postgres -f /tmp/innode-20181019null.sql

