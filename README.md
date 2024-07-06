# Cluster de Hadoop con Docker

En el fichero docker-compose.yaml se pueden configurar tantos nodos se quieran copiando la configuración de **datanode2** y renombrando con *datanode3, datanode4*...

*   Ubuntu 22.04
*   Hadoop 3.4.0
*   Hive 4.0.0
*   Flume 1.11.0
*   Jupyter Notebook 7.2.1

1. Iniciar con docker compose:
   ```
   docker-compose up -d
   ```
3. Inspeccionar la red
   ```
   docker network ls
   ```
   Localizar la red creada *_hadoop: si se llama entorno_hadoop por ejemplo:
   ```
   docker network inspect entorno_hadoop
   ```
   
5. Modificar el fichero hosts. En linux se encuentra en /etc/hosts. Mapear las IP con cada contenedor:

   ```
   172.19.0.2  yarnmanager
   172.19.0.3  namenode
   172.19.0.4  datanode1
   172.19.0.5  datanode2
   ```
7. URL de interés
   *   Iniciar Jupyter Notebooks: [http://namenode:8888/tree](http://namenode:8888/tree)
   *   Interfaz Hadoop Namenode: [http://namenode:9870/](http://namenode:9870/)
   *   Job History MapReduce: [http://yarnmanager:19888/jobhistory](http://yarnmanager:19888/jobhistory)
   *   Yarn Manager: [http://yarnmanager:8088/cluster](http://yarnmanager:8088/cluster)
