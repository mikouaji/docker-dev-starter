.PHONY: start stop env status sh shroot npm install build preview lint format update run generate

preview:
	cd .docker && docker-compose up

start:
	cd .docker && docker-compose up -d

stop:
	cd .docker && docker-compose stop

env:
	cd .docker && docker-compose build --force-rm

status:
	cd .docker && docker-compose ps

sh:
	cd .docker && docker-compose exec web /bin/bash

shroot:
	cd .docker && docker-compose exec -u root web /bin/bash

install:
	cd .docker && docker-compose run --rm -w /app web npm install

update:
	cd .docker && docker-compose run --rm -w /app web npm up --latest

build:
	cd .docker && docker-compose run --rm -w /app web npm run build

generate:
	cd .docker && docker-compose run --rm -w /app web npm run generate

run:
	cd .docker && docker-compose run --rm -w /app web $(do)

npm:
	cd .docker && docker-compose run --rm -w /app web npm $(do)

format:
	cd .docker && docker-compose run --rm -w /app web npm run format

lint:
	cd .docker && docker-compose run --rm -w /app web npm run lint
