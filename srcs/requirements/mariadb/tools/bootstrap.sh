mysqld --user=mysql --bootstrap << EOF
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE User='';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_RPW';
CREATE DATABASE $SQL_DB CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '$SQL_USR'@'%' IDENTIFIED by '$SQL_PW';
GRANT ALL PRIVILEGES ON $SQL_DB.* TO '$SQL_USR'@'%';
FLUSH PRIVILEGES;
EOF
exec mysqld --user=mysql --console
