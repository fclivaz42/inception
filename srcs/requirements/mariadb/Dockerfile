# MariaDB

FROM alpine:3.20

RUN apk update
RUN apk upgrade
RUN apk add mariadb mariadb-client mariadb-openrc vim
RUN mkdir -p /var/lib/mysql
RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql
RUN chown -R mysql:mysql /run/mysqld
COPY conf/mariadb.conf /etc/my.cnf.d/mariadb-server.cnf
