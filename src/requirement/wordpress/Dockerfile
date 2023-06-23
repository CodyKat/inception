FROM debian:bullseye-slim
RUN apt-get update && apt-get install -y\
	php7.4-fpm \
	php7.4-mysql \
	php7.4-curl \
	wget \
	php7.4-cgi \
	php7.4-pdo \
	php7.4-gd \
	php7.4-cli \
	php7.4-mbstring \
	php-redis


EXPOSE 9000
RUN mkdir -p /run/php/
RUN touch /run/php/php7.4-fpm.sock
RUN echo "[global]\ndaemonize = no" >> /etc/php/7.4/fpm/php-fpm.conf
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools/start-script.sh /start-script.sh
RUN chmod +x /start-script.sh
WORKDIR /var/www/html/
ENTRYPOINT ["/start-script.sh"]
CMD ["php-fpm7.4", "-F"]
