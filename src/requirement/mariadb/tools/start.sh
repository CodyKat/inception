#!/bin/bash
STATUS="$(service mariadb status)"
if [ "${STATUS}" != "MariaDB is stopped.." ]; then
    echo "mariadb is running"
else
    service mariadb start
    while :
    do
        STATUS="$(service mariadb status)"
        if [ "${STATUS}" != "MariaDB is stopped.." ]; then
            break
        fi
    done
fi
exec mysqld