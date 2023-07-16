#!/bin/bash

# Start the MySQL service
service mysql start

# Create the database if it doesn't exist
mysql -e "CREATE DATABASE IF NOT EXISTS ${MDB_DBNAME} DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

# Create or update the user with the provided password
mysql -e "CREATE USER IF NOT EXISTS '${MDB_USER}'@'%' IDENTIFIED BY '${MDB_USER_PASS}';"
mysql -e "ALTER USER '${MDB_USER}'@'%' IDENTIFIED WITH mysql_native_password BY '${MDB_USER_PASS}';"

# Grant all privileges on the database to the user
mysql -e "GRANT ALL PRIVILEGES ON ${MDB_DBNAME}.* TO '${MDB_USER}'@'%';"

# Reload privileges
mysql -e "FLUSH PRIVILEGES;"

# Update the root user password
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MDB_ROOT_PASS}';"

# Stop the MySQL service
service mysql stop

# Execute the provided command or script
exec "$@"
