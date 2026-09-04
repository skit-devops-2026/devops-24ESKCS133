APP_NAME ?= kisan-market
IMAGE ?= kisan-market:local
PORT ?= 8080

.PHONY: validate test build docker-build docker-run clean

validate:
	@./scripts/validate.sh

test: validate

build:
	@echo "Static application: no compilation step required."
	@echo "HTML/CSS/JS files are ready to be served by Nginx."

docker-build:
	docker build -t $(IMAGE) .

docker-run:
	docker run --rm -p $(PORT):80 $(IMAGE)

clean:
	@echo "Nothing to clean for the static frontend."
