.PHONY: homeassistant fullcontrol
.SILENT: homeassistant fullcontrol
homeassistant:
	docker compose up -d homeassistant
fullcontrol:
	docker compose up fullcontrol
