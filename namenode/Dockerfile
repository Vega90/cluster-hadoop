# Utilizar la imagen base de Ubuntu
FROM vega90/hadoop-base:1.0

# Actualizar el sistema e instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-dev \
    build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Instalar Jupyter Notebook utilizando pip y algunas librerias
RUN pip3 install --no-cache-dir jupyter
RUN pip3 install pandas
RUN pip3 install fastavro
RUN pip3 install fastparquet
RUN pip3 install pyarrow
RUN pip3 install psutil

# Exponer el puerto de Jupyter Notebook
EXPOSE 8888

# carpeta para namenode
RUN mkdir -p /hdfs/namenode

# format namenode
RUN /usr/local/hadoop/bin/hdfs namenode -format

# puerto para namenode
EXPOSE 9000

#instalar hive 4.0.0
RUN wget http://apache.rediris.es/hive/hive-4.0.0/apache-hive-4.0.0-bin.tar.gz && \
    tar xvf apache-hive-4.0.0-bin.tar.gz && \
    mv apache-hive-4.0.0-bin /usr/local/hive && \
    rm apache-hive-4.0.0-bin.tar.gz

ENV HIVE_HOME=/usr/local/hive
ENV PATH=$PATH:/usr/local/hive/bin

# Configuracion Hive
COPY config/hive-site.xml /usr/local/hive/conf/hive-site.xml
RUN chmod 777 /usr/local/hive/conf/hive-site.xml

#puertos hive
EXPOSE 10000 10002

#instalar flume 1.11.0
RUN wget https://dlcdn.apache.org/flume/1.11.0/apache-flume-1.11.0-bin.tar.gz && \
    tar -xzvf apache-flume-1.11.0-bin.tar.gz && \
    mv apache-flume-1.11.0-bin /usr/local/flume && \
    rm apache-flume-1.11.0-bin.tar.gz

ENV FLUME_HOME=/usr/local/flume
ENV FLUME_CONF_DIR=$FLUME_HOME/conf
ENV FLUME_CLASSPATH=$FLUME_CONF_DIR
ENV PATH=$PATH:$FLUME_HOME/bin

#puerto para avro
EXPOSE 41414

# Copiar los ficheros de configuracion y comienzo
COPY config/namenode.conf /etc/supervisor/conf.d/namenode.conf
COPY config/start.sh /etc/start.sh
RUN chmod 777 /etc/start.sh

WORKDIR $HIVE_HOME

RUN $HIVE_HOME/bin/schematool -dbType derby -initSchema
# volumen para hdfs
VOLUME /hdfs

WORKDIR /root
# empezar el supervisor
CMD ["supervisord", "-c", "/etc/supervisor/conf.d/namenode.conf"]

