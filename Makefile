.PHONY: homeassistant fullcontrol
.SILENT: homeassistant fullcontrol
homeassistant:
	docker compose up -d homeassistant
fullcontrol:
	docker compose up fullcontrol

.PHONY: test build up purge generate test
.SILENT: test build up purge generate test

build:
	$(MAKE) -C ../Full-Control-Home-Assistant all
up:
	docker compose up homeassistant postgres

purge:
	docker compose down -v --remove-orphans
	#sudo rm -Rf home-assistant

generate:
	$(MAKE) -C ../Full-Control-Home-Assistant fix
	docker compose \
		run \
			--no-deps \
			--rm \
			--user $(shell id -u) \
			fullcontrol \
				fullcontrol \
					-w /fullcontrol

test: purge
	docker compose run fullcontrol
	docker compose logs -f homeassistant