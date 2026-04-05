DOCKER_COMPOSE = docker compose

.PHONY: up
up:
	$(DOCKER_COMPOSE) up --build -d

.PHONY: logs
logs:
	$(DOCKER_COMPOSE) logs -f

.PHONY: down
down:
	$(DOCKER_COMPOSE) down
