#!/bin/bash

set -x;
set -e;


MYSQL_PASS=$1
DATABASE_NAME=$2
DATABASE_PASS=$3
mysql -u root -p$MYSQL_PASS -e "CREATE DATABASE $DATABASE_NAME;GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DATABASE_NAME'@'localhost' IDENTIFIED BY '$DATABASE_PASS';DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');DELETE FROM mysql.user WHERE User='';DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';FLUSH PRIVILEGES;"
