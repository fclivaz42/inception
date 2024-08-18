# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fclivaz <fclivaz@student.42lausanne.ch>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/18 02:58:26 by fclivaz           #+#    #+#              #
#    Updated: 2024/08/18 18:03:49 by fclivaz          ###   LAUSANNE.ch        #
#                                                                              #
# **************************************************************************** #

all: build

build:
	docker-compose -p inception -f ./srcs/docker-compose.yml build

up: build
	docker-compose -p inception -f ./srcs/docker-compose.yml up -d

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
