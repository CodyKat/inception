CREATE database "$MARIADB_NAME"; 
CREATE user "$MARIADB_USER"@'%';
SET PASSWORD for "$MARIADB_USER"@'%'= PASSWORD("$MARIADB_PASSWORD");
GRANT all privileges on "$MARIADB_NAME".* to "$MARIADB_USER"@'%' identified by "$MARIADB_PASSWORD"
FLUSH privileges;