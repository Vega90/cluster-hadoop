# Cluster de Hadoop con Docker

En el fichero docker-compose.yaml se pueden configurar tantos nodos se quieran copiando la configuración de **datanode2**. Ahora mismo hay cuatro nodos en el fichero docker-compose.yaml. Puedes añadir o eliminar nodos dejando siempre al menos uno.

Versiones del clúster:

*   Ubuntu 22.04
*   Hadoop 3.4.0
*   Hive 4.0.0
*   Flume 1.11.0
*   Jupyter Notebook 7.2.1

### **INSTRUCCIONES**

1. Iniciar con docker compose:
   ```
   docker-compose up -d
   ```
   
2. URL de interés
   *   Iniciar Jupyter Notebook: [http://localhost:8888/tree](http://localhost:8888/tree)
   *   Interfaz Hadoop Namenode: [http://localhost:9870/](http://localhost:9870/)
   *   Job History MapReduce: [http://localhost:19888/jobhistory](http://localhost:19888/jobhistory)
   *   Yarn Manager: [http://localhost:8088/cluster](http://localhost:8088/cluster)
