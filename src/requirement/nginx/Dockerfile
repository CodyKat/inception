FROM debian:bullseye-slim
RUN apt-get update && \
	apt-get install -y \
	nginx \
	openssl \
	vim
	# mariadb-client \
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./tools/certs /certs
WORKDIR /certs
RUN chmod +x certs.sh
RUN certs.sh
ENTRYPOINT ["nginx", "-g", "daemon off;"]
# ENTRYPOINT ["tail", "-f", "/dev/null"]
