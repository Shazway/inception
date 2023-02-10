#!/bin/bash

service mysql start;

mysql -e "CREATE DATABASE IF IT DOES NOT EXIST \`$(DB_NAME)\`;"
mysql -e "CREATE USER IF IT DOES NOT EXIST \`$(DB_USER)\`'@localhost' IDENTIFIED BY '$(DB_PASSWORD)';"
mysql -e "GRANT ALL PRIVILEGES ON \`$(DB_NAME)\`;.* TO \`$(DB_USER)\`@'%' IDENTIFIED BY '$(DB_PASSWORD)';"
mysql -e "ALTER USER 'root@localhost' IDENTIFIED BY '$(DB_PASSWORD)';"
mysql -e "FLUSH PRIVILEGES"
mysqladmin -u root -p$DB_PASSWORD shutdown

exec "$@"