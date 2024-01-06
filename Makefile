.PHONY: homeassistant fullcontrol
.SILENT: homeassistant fullcontrol
homeassistant:
	docker compose up -d homeassistant
fullcontrol:
	docker compose up fullcontrol

.PHONY: test
.SILENT: test
test:
	$(MAKE) -C ../Full-Control-Home-Assistant fix
	docker compose \
		run \
			--no-deps \
			--rm \
			--user $(shell id -u) \
			fullcontrol \
				fullcontrol \
					-w /fullcontrol

