FROM debian:bullseye-slim
RUN apt-get update
RUN apt-get install -y mariadb-server \
    vim \
    dumb-init
# RUN rm -rf /var/lib/apt/lists/*
COPY ./tools/start.sh /start.sh
# COPY ./conf/mysqld.cnf /etc/mysql/conf.d/
RUN chmod +x /start.sh
EXPOSE 3306
RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
# dumb-init
ENTRYPOINT [ "dumb-init", "--" ]

CMD [ "/start.sh" ]
# ENTRYPOINT [ "tail", "-f", "/dev/null" ]