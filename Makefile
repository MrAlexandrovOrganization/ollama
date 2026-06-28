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

.PHONY: list
list:
	docker exec ollama-ollama-1 ollama list

# .PHONY: rm
# 	docker exec ollama-ollama-1 ollama rm qwen3-vl:2b glm-ocr:bf16 qwen2.5:1.5b
