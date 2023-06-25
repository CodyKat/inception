FROM debian:bullseye-slim
RUN apt-get update && \
	apt-get install -y \
	nginx \
	openssl \
	vim \
	dumb-init
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./tools/certs/lesstif.com.crt /etc/ssl/certs
COPY ./tools/certs/lesstif.com.key /etc/ssl/certs
ENTRYPOINT [ "dumb-init", "--" ]
CMD ["nginx", "-g", "daemon off;"]
# CMD ["/bin/bash;"]
