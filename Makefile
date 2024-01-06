



all:
	mkdir -p /home/okrich/data/mariadb
	mkdir -p /home/okrich/data/www
	docker compose -f ./srcs/docker-compose.yml up --build 

clean:
	docker compose -f ./srcs/docker-compose.yml down