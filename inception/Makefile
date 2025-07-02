DOCKER_COMPOSE = ./srcs/docker-compose.yml

all: up

up:
	docker compose -f $(DOCKER_COMPOSE) up --build

down:
	docker compose -f $(DOCKER_COMPOSE) down

vdown:
	docker compose -f $(DOCKER_COMPOSE) down -v

stop:
	docker compose -f $(DOCKER_COMPOSE) stop
