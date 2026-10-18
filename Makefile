DOCKER_COMPOSE_BASE = docker compose --project-directory "$(CURDIR)"
include makefiles/compose.mk
DOCKER_COMPOSE = docker compose --project-directory "$(CURDIR)" $(COMPOSE_FLAGS)

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
	$(DOCKER_COMPOSE) exec -T ollama ollama list

# .PHONY: rm
# 	$(DOCKER_COMPOSE) exec -T ollama ollama rm qwen3-vl:2b glm-ocr:bf16 qwen2.5:1.5b

# Read-only validation of every tracked Compose combination, without runtime secrets.
.PHONY: compose-layout-check
compose-layout-check:
	$(DOCKER_COMPOSE_BASE) --env-file /dev/null -f compose/docker-compose.yml --profile '*' config --no-interpolate --no-env-resolution --quiet

check: compose-layout-check
