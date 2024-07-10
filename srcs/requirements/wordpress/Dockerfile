# Wordpress

FROM alpine:3.20

RUN apk update
RUN apk upgrade
RUN apk add vim wget curl php83 php83-fpm php83-mysqli mariadb-client
RUN wget https://wordpress.org/wordpress-6.5.5.tar.gz -P /var/www
RUN cd /var/www && tar zxvf wordpress-6.5.5.tar.gz
RUN rm /var/www/wordpress-6.5.5.tar.gz
