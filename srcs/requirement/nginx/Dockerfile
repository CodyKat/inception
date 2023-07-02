FROM debian:bullseye-slim
RUN apt-get update && \
	apt-get install -y \
	nginx \
	openssl \
	vim \
	dumb-init
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
RUN sed -i 's/TLSv1 TLSv1.1//g' /etc/nginx/nginx.conf
COPY ./tools/start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT [ "dumb-init", "--" ]
CMD ["/start.sh"]
