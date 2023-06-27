FROM debian:bullseye-slim
RUN apt-get update && apt-get install -y\
    mariadb-server \
    dumb-init
COPY ./tools/start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 3306
RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
ENTRYPOINT [ "dumb-init", "--" ]
CMD [ "/start.sh" ]
