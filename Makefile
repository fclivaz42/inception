# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fclivaz <fclivaz@student.42lausanne.ch>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/18 02:58:26 by fclivaz           #+#    #+#              #
#    Updated: 2024/08/18 03:04:09 by fclivaz          ###   LAUSANNE.ch        #
#                                                                              #
# **************************************************************************** #

all: up

up:
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down -v

start:
	docker-compose -f ./srcs/docker-compose.yml start

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

status:
	docker ps -a

network:
	docker network ls

nuke: down
	docker system prune -af
