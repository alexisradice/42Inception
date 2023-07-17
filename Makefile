all: build
	mkdir -p /home/aradice/data/wordpress
	mkdir -p /home/aradice/data/mariadb

build:
	docker-compose -f srcs/docker-compose.yml up -d --build 

up:
	mkdir -p /home/aradice/data/wordpress
	mkdir -p /home/aradice/data/mariadb
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

fclean:
	docker stop $$(docker ps -qa) || true
	docker rm $$(docker ps -qa) || true
	docker rmi -f $$(docker images -qa) || true
	docker volume rm $$(docker volume ls -q) || true
	docker system prune -f
	sudo rm -rf /home/aradice/data/wordpress
	sudo rm -rf /home/aradice/data/mariadb

.PHONY:	all up down fclean
