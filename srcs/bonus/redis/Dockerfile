# Redis

FROM alpine:3.20

RUN apk update
RUN apk upgrade
RUN apk add vim redis redis-openrc
RUN sed -i "s/# maxmemory <bytes>/maxmemory 512mb/g" /etc/redis.conf
RUN sed -i "s/# maxmemory-policy noeviction/maxmemory-policy allkeys-lru/g" /etc/redis.conf

ENTRYPOINT ["redis-server", "--protected-mode", "no"]
