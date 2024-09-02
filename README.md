# Cluster de Hadoop con Docker

En el fichero docker-compose.yaml se pueden configurar tantos nodos se quieran copiando la configuración de **datanode2**. Ahora mismo hay cuatro nodos en el fichero docker-compose.yaml. Puedes añadir o eliminar nodos dejando siempre al menos uno. No olvides modificar los nombres y añadir direcciones IP válidas en caso de que escales el clúster.

Las imágenes están en el repositorio Docker Hub:  [https://hub.docker.com/repositories/vega90](https://hub.docker.com/repositories/vega90)

Versiones del clúster:

*   Ubuntu 22.04
*   Hadoop 3.4.0
*   Hive 4.0.0
*   Flume 1.11.0
*   Jupyter Notebook 7.2.1

### **INSTRUCCIONES**

1. Navegar a la carpeta donde se encuentre el fichero docker compose y ejecutar:
   ```
   docker-compose up -d
   ```
   Con este comando se descargarán las imágenes y comenzará el despliegue del entorno.
   
3. Realiza el mapeo de direcciones en tu fichero hosts, en linux /etc/hosts, añade las líneas:
    ```
   # Mapeo IP - Contenedores Docker
   172.18.0.2       namenode
   172.18.0.3       yarnmanager
   172.18.0.4       datanode1
   172.18.0.5       datanode2
   172.18.0.6       datanode3
   172.18.0.7       datanode4
   ```
   Al incorporar estas direcciones, puedes acceder a los contenedores por su nombre: namenode, datanode1, yarnmanager, etc.
   
4. URL de interés
   *   Iniciar Jupyter Notebook: [http://localhost:8888/tree](http://localhost:8888/tree) o  [http://namenode:8888/tree](http://namenode:8888/tree)
   *   Interfaz Hadoop Namenode: [http://localhost:9870/](http://localhost:9870/) o [http://namenode:9870/](http://namenode:9870/)
   *   Job History MapReduce: [http://localhost:19888/jobhistory](http://localhost:19888/jobhistory) o [http://yarnmanager:19888/jobhistory](http://yarnmanager:19888/jobhistory)
   *   Yarn Manager: [http://localhost:8088/cluster](http://localhost:8088/cluster) o [http://yarnmanager:8088/cluster](http://yarnmanager:8088/cluster)
