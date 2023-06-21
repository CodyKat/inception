FROM debian:bullseye-slim
RUN apt-get update && \
	apt-get install -y \
	nginx \
	mariadb-client \
	vim
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
