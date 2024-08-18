# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fclivaz <fclivaz@student.42lausanne.ch>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/18 02:58:26 by fclivaz           #+#    #+#              #
#    Updated: 2024/08/18 23:22:43 by fclivaz          ###   LAUSANNE.ch        #
#                                                                              #
# **************************************************************************** #

all: build

bonus: buildnus

build:
	docker-compose -p inception -f ./srcs/docker-compose.yml build

up: build
	ls ~/data/mariadb || mkdir -p ~/data/mariadb
	ls ~/data/wordpress || mkdir -p ~/data/wordpress
	docker-compose -p inception -f ./srcs/docker-compose.yml up -d

buildnus:
	docker-compose -p inception -f ./srcs/docker-bonus-compose.yml build

bonup: buildnus
	ls ~/data/mariadb || mkdir -p ~/data/mariadb
	ls ~/data/wordpress || mkdir -p ~/data/wordpress
	docker-compose -p inception -f ./srcs/docker-bonus-compose.yml up -d

downus:
	docker-compose -p inception -f ./srcs/docker-bonus-compose.yml down -v

down:
	docker-compose -p inception -f ./srcs/docker-compose.yml down -v

start:
	docker-compose -p inception -f ./srcs/docker-compose.yml start

stop:
	docker-compose -p inception -f ./srcs/docker-compose.yml stop

status:
	docker ps -a

network:
	docker network ls

nuke: down
	docker system prune -af

nuske: downus
	docker system prune -af

re: nuke
	make all
