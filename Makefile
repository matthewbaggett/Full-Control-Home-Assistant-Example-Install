.PHONY: homeassistant fullcontrol
.SILENT: homeassistant fullcontrol
homeassistant:
	docker compose up -d homeassistant
fullcontrol:
	docker compose up fullcontrol
clean:
	docker compose down -v

.PHONY: test build generate copy logs
.SILENT: test build generate copy logs
build:
	$(MAKE) -C ../Full-Control-Home-Assistant all
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

copy:
	docker compose \
		run \
			--no-deps \
			--rm \
			--user $(shell id -u) \
			fullcontrol \
				cp -av /fullcontrol/build/. /config

logs:
	docker compose logs -f homeassistant

test: clean generate copy homeassistant logs
