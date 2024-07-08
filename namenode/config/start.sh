#!/bin/bash

echo "Iniciando Jupyter Notebook"

jupyter notebook --ip='*' --port=8888 --no-browser --allow-root --NotebookApp.password='' --NotebookApp.token='' --notebook-dir='/media/notebooks' &

echo "Iniciado Jupyter en el puerto 8888"
echo "##################################"
echo "Iniciando Nodename"

/usr/bin/supervisord -c /etc/supervisor/conf.d/namenode.conf 





