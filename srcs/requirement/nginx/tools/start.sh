#!/bin/bash

# Generate a new private key
openssl genrsa -out "/etc/ssl/private/${DOMAIN}.key" 2048

# Create a CSR using the private key
openssl req -new -key "/etc/ssl/private/${DOMAIN}.key" -out "/etc/ssl/certs/${DOMAIN}.csr" -subj "/CN=${DOMAIN}"

# Sign the CSR with our own private key to create the cert
openssl x509 -req -days 365 -in "/etc/ssl/certs/${DOMAIN}.csr" -signkey "/etc/ssl/private/${DOMAIN}.key" -out "/etc/ssl/certs/${DOMAIN}.crt"
exec nginx -g 'daemon off;'
