# NGINX

FROM alpine:3.20

RUN apk update
RUN apk upgrade
RUN apk add nginx vim curl openssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=CH/ST=Vaud/L=Lausanne/O=42/OU=42/CN=fclivaz.42.fr/UID=fclivaz"
COPY conf/nginx.conf /etc/nginx/http.d/nginx.conf
RUN sed -i "s/ TLSv1.1//g" /etc/nginx/nginx.conf
# RUN chmod 755 /var/www/wordpress
# RUN chown -R www-data:www-data /var/www/wordpress

# EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
