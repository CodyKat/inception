#!/bin/bash

openssl genrsa -aes256 -out lesstif-rootca.key 2048 << heredoc
jaemjeon
jaemjeon
heredoc
chmod 600 lesstif-rootca.key
openssl req -new -key lesstif-rootca.key -out lesstif-rootca.csr << herdoc
jaemjeon
KR
Seoul
Seoul
42seoul
cadet
172.30.1.33



herdoc
openssl x509 -req -days 3650 \
	-extensions v3_ca \
	-set_serial 1 \
	-in lesstif-rootca.csr \
	-signkey lesstif-rootca.key \
	-out lesstif-rootca.crt \
	-extfile rootca_openssl.conf << heredoc
jaemjeon
heredoc

openssl x509 -text -in lesstif-rootca.crt
openssl genrsa -aes256 -out lesstif.com.key 2048 << heredoc
jaemjeon
jaemjeon
heredoc
cp  lesstif.com.key  lesstif.com.key.enc
openssl rsa -in  lesstif.com.key.enc -out lesstif.com.key << heredoc
jaemjeon
heredoc
chmod 600 lesstif.com.key*
openssl req -new -key lesstif.com.key -out lesstif.com.csr -config /certs/host_openssl.conf << heredoc




heredoc
openssl x509 -req -days 1825 -extensions v3_user -in lesstif.com.csr \
	-CA lesstif-rootca.crt -CAcreateserial \
	-CAkey  lesstif-rootca.key \
	-out lesstif.com.crt  -extfile /certs/host_openssl.conf << heredoc
jaemjeon
heredoc
openssl x509 -text -in lesstif.com.crt
cp lesstif.com.crt  /etc/ssl/certs/
cp lesstif.com.key /etc/ssl/certs/
nginx -g daemon off;