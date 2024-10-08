# Utilizar la imagen base de Ubuntu
FROM ubuntu:22.04

LABEL maintainer="Ana Isabel Candon"

# Establecer las variables de entorno para no necesitar interacción manual durante la instalación
ENV DEBIAN_FRONTEND=noninteractive

# install openssh-server, openjdk and wget
RUN apt-get update && apt-get install -y openssh-server openjdk-8-jdk wget
RUN apt-get install -y iputils-ping
RUN apt-get install -y supervisor


# install hadoop 3.4.0
RUN wget http://apache.rediris.es/hadoop/common/hadoop-3.4.0/hadoop-3.4.0.tar.gz && \
    tar -xzvf hadoop-3.4.0.tar.gz && \
    mv hadoop-3.4.0 /usr/local/hadoop && \
    rm hadoop-3.4.0.tar.gz

# set environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 
ENV HADOOP_HOME=/usr/local/hadoop
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
ENV YARN_CONF_DIR=$HADOOP_CONF_DIR
ENV HADOOP_YARN_HOME=$HADOOP_HOME
ENV HADOOP_MAPRED_HOME=$HADOOP_HOME

ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$HADOOP_HOME/etc/hadoop/:/usr/bin/

COPY config/* /tmp/

RUN mkdir /usr/local/hadoop/logs

RUN mv /tmp/hdfs-site.xml $HADOOP_CONF_DIR/hdfs-site.xml 
RUN mv /tmp/core-site.xml $HADOOP_CONF_DIR/core-site.xml 
RUN mv /tmp/mapred-site.xml $HADOOP_CONF_DIR/mapred-site.xml 
RUN mv /tmp/yarn-site.xml $HADOOP_CONF_DIR/yarn-site.xml

CMD ["hadoop", "version"]
