#基础镜像
#FROM postgres:9.4.0
FROM 192.168.3.207:5000/fft/postgres:v1.3

#修改系统时区时间
#RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ADD pg_hba.conf /var/lib/postgresql/
ADD innode-20181019null.sql /var/lib/postgresql/data
RUN su postgres
RUN createdb innode -U postgres -E UTF8 -e
RUN psql -d innode -U innodb -f /var/lib/postgresql/data/innode-20181019null.sql
     
VOLUME /var/lib/postgresql/data

EXPOSE 5432

CMD ["postgres"]