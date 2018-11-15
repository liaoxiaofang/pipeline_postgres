#!/bin/bash
#将如果需要postgres以外的数据库用户连接，请将该文件覆盖到/var/lib/postgresql/data目录下(注：目前只允许postgres连接)
cp /tmp/pg_hba.conf /var/lib/postgresql/data
#以下是创建innode实例，导入基础数据操作
su postgres 
createdb innode -U postgres -E UTF8 -e
psql -d innode -U postgres -f /tmp/innode-20181019null.sql
psql -d postgres -U postgres
CREATE USER innodb WITH PASSWORD '888888';
GRANT ALL PRIVILEGES ON DATABASE innode to innodb;
\q
