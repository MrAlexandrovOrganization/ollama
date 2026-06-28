DOCKER_COMPOSE = docker compose

.PHONY: up
up:
	$(DOCKER_COMPOSE) up --build -d

.PHONY: logs
logs:
	$(DOCKER_COMPOSE) logs -f --tail=50

.PHONY: logs-ollama
logs-ollama:
	$(DOCKER_COMPOSE) logs -f --tail=50 ollama

.PHONY: logs-webui
logs-webui:
	$(DOCKER_COMPOSE) logs -f --tail=50 open-webui

.PHONY: restart
restart:
	$(DOCKER_COMPOSE) restart

.PHONY: recreate
recreate:
	$(DOCKER_COMPOSE) up -d --force-recreate

.PHONY: down
down:
	$(DOCKER_COMPOSE) down
