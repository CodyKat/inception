#!/bin/bash

mysql_install_db --skip-test-db
chown -R mysql:mysql /var/lib/mysql
STATUS="$(service mariadb status)"
echo "try booting mariadb.."
if [ "${STATUS}" != "MariaDB is stopped.." ]; then
    echo "mariadb is running"
else
    while :
    do
        service mariadb start
        STATUS="$(service mariadb status)"
        if [ "${STATUS}" != "MariaDB is stopped.." ]; then
            break
        else
            echo "retry boot MariaDB..."
        fi
    done
fi

echo mariadb database = $MARIADB_DATABASE

if [ ! -d /var/lib/mariadb/$MARIADB_DATABASE ]; then
    mysql -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;\
                CREATE USER IF NOT EXISTS '$MARIADB_USER'@'localhost';\
                SET PASSWORD for '$MARIADB_USER'@'localhost'= PASSWORD('$MARIADB_PASSWORD');\
                GRANT all privileges on $MARIADB_DATABASE.* to '$MARIADB_USER'@'%' identified by '$MARIADB_PASSWORD';\
                FLUSH privileges;"
fi

mysqladmin -uroot -p password '$MARIADB_ROOT_PASSWORD'

service mariadb stop
echo "try rebooting mariadb.."
if [ "${STATUS}" = "MariaDB is stopped.." ]; then
    echo "mariadb is stopped"
else
    while :
    do
        STATUS="$(service mariadb status)"
        if [ "${STATUS}" = "MariaDB is stopped.." ]; then
            break
        fi
    done
fi
exec mysqld_safe
