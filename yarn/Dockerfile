FROM vega90/hadoop-base:1.0


COPY config/yarn.conf /etc/supervisor/conf.d/yarn.conf


#expose ressourcemanager port
EXPOSE 8032 8080 8088 19888

#start the supervisor
CMD ["supervisord", "-c", "/etc/supervisor/conf.d/yarn.conf"]
