# Adminer

FROM alpine:3.20

RUN apk update
RUN apk upgrade
RUN apk add vim wget curl php83 php83-mysqli
RUN wget http://www.adminer.org/latest.php -O /var/www/wordpress/adminer.php
RUN chmod 755 /var/www/wordpress/adminer.php
RUN rm -rf /var/www/wordpress/index.html

ENTRYPOINT ["php", "-s", "0.0.0.0:80"]
