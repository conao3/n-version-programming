## Makefile

all: main
.PHONY: up exec down main rebuid login

src/.random:
	od -vAn -to1 </dev/urandom | head -1 | sed 's/^ *//' > $@

.docker: src/.random
	docker-compose up -d
	touch $@

up: .docker

exec: .docker src/.random
	docker-compose exec main './src/main'

down:
	if [ -f .docker ]; then docker-compose down; fi
	rm -rf .docker

main:
	$(MAKE) up
	$(MAKE) exec
	$(MAKE) down

## debug

rebuild:
	$(MAKE) down
	docker-compose up -d --build
	touch .docker

login: .docker
	docker-compose exec main bash
