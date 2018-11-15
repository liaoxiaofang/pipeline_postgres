#基础镜像
#FROM postgres:9.4.0
FROM 192.168.3.207:5000/fft/postgres:v1.3

#将pg_hba.conf添加到镜像内
ADD pg_hba.conf /tmp/
#将要导入的基础数据包添加到镜像内（innode-20181019null.sql根据自己的项目替换）
ADD innode-20181019null.sql /tmp/
ADD createdb.sh /tmp
RUN chmod a+x /tmp/createdb.sh

VOLUME /var/lib/postgresql/data

EXPOSE 5432

CMD ["postgres"]