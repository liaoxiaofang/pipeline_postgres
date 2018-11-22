#基础镜像
FROM 192.168.3.207:5000/fft/postgres:v1.3

#将pg_hba.conf添加到镜像内
COPY pg_hba.conf /tmp/
#将要导入的基础数据包添加到镜像内（innode-20181019null.sql根据自己的项目替换）
COPY innode-20181019null.sql /tmp/
#用于创建实例、用户、授权、导入数据库实例的脚本，容器创建成功后需要进到容器内/tmp目录下手动执行该脚本
COPY createdb.sh /tmp
#添加可执行权限
RUN chmod a+x /tmp/createdb.sh

VOLUME /var/lib/postgresql/data

EXPOSE 5432

#ENTRYPOINT ["/tmp/createdb.sh"]
CMD ["postgres"]