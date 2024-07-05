#!/bin/bash

$HADOOP_HOME/bin/hdfs dfs -mkdir -p /curso
$HADOOP_HOME/bin/hdfs dfs -mkdir -p /user/hive/warehouse

$HADOOP_HOME/bin/hdfs dfs -chmod g+w /user/hive/warehouse
$HADOOP_HOME/bin/hdfs dfs -chmod g+w /curso

# init hive metastorage
$HIVE_HOME/bin/schematool -dbType derby -initSchema
