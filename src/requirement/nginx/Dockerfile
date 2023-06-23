FROM debian:bullseye-slim
RUN apt-get update && \
	apt-get install -y \
	nginx \
	openssl
	# mariadb-client \
	# vim
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./tools/ssl.sh /
RUN chmod +x /ssl.sh
# RUN /ssl.sh
# ENTRYPOINT ["nginx", "-g", "daemon off;"]
ENTRYPOINT ["tail", "-f", "/dev/null"]
