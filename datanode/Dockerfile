# Utilizar la imagen base de Ubuntu
FROM vega90/hadoop-base:1.0

RUN mkdir -p /hdfs/datanode

COPY config/datanode.conf /etc/supervisor/conf.d/datanode.conf

EXPOSE 50020 50075 8042

VOLUME /hdfs

#start the supervisor
CMD ["supervisord", "-c", "/etc/supervisor/conf.d/datanode.conf"]
