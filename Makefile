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
	#$(MAKE) -C ../Full-Control-Home-Assistant all
	docker compose build --progress=plain fullcontrol
generate:
	$(MAKE) -C ../Full-Control-Home-Assistant fix
	docker compose \
		run \
			--no-deps \
			--rm \
			fullcontrol

logs:
	docker compose logs -f homeassistant

test: clean generate homeassistant logs
