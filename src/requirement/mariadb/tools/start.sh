#!/bin/bash

chown -R mysql:mysql /var/lib/mysql
mysql_install_db # --user=jaemjeon --datadir=/var/lib/mysql
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

# mysql < init.sql