#基础镜像
FROM postgres:9.4.0

#修改系统时区时间
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#ADD pg_hba.conf /var/lib/postgresql/data/
VOLUME /var/lib/postgresql/data

EXPOSE 5432

CMD ["postgres"]