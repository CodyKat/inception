#!/bin/bash
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
        fi
    done
fi
exec mysqld