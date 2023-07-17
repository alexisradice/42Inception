#!/bin/bash

service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS ${MDB_DBNAME} DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

mysql -e "CREATE USER IF NOT EXISTS '${MDB_USER}'@'%' IDENTIFIED BY '${MDB_USER_PASS}';"
mysql -e "ALTER USER '${MDB_USER}'@'%' IDENTIFIED WITH mysql_native_password BY '${MDB_USER_PASS}';"

mysql -e "GRANT ALL PRIVILEGES ON ${MDB_DBNAME}.* TO '${MDB_USER}'@'%';"

mysql -e "FLUSH PRIVILEGES;"

mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MDB_ROOT_PASS}');"

service mysql stop

exec "$@"
