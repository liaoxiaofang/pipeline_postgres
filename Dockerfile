#基础镜像
#FROM postgres:9.4.0
FROM 192.168.3.207:5000/fft/postgres:v1.3

#修改系统时区时间
#RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#将pg_hba.conf添加到镜像内，如果需要postgres以外的数据库用户连接，请将该文件覆盖到/var/lib/postgresql/data目录下，目前只允许postgres连拉接
#ADD pg_hba.conf /var/lib/postgresql/
#将要导入的基础数据包添加到镜像内（innode-20181019null.sql根据自己的项目替换）
#ADD innode-20181019null.sql /var/lib/postgresql/
#RUN su postgres 
#RUN createdb innode -U postgres -E UTF8 -e
#RUN psql -d innode -U postgres -f /var/lib/postgresql/innode-20181019null.sql
     
VOLUME /var/lib/postgresql/data

EXPOSE 5432

CMD ["postgres"]