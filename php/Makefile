# docker-compose Makefile for vite+vue-ts frontend app

.PHONY: start stop env restart reset composer-install composer mysql-clear mysql-init mysql-migrate mysql-seed mongo-clear db status show-config sh shroot

env:
	cd docker && docker-compose build --force-rm

start:
	cd docker && docker-compose up -d
stop:
	cd docker && docker-compose stop
restart:
	cd docker && docker-compose restart
reset:
	make stop && make start

composer-install:
	cd docker && docker-compose exec -T httpd composer install --working-dir=project
composer:
	cd docker && docker-compose exec -T httpd composer $(do) --working-dir=project

mysql-clear:
	cd docker && docker-compose exec -T mysql bash /reset.sh
mysql-init:
	cd docker && docker-compose exec -T httpd php project/spark migrate && docker-compose exec -T httpd php project/spark db:seed Run
mysql-migrate:
	cd docker && docker-compose exec -T httpd php project/spark migrate
mysql-seed:
	cd docker && docker-compose exec -T httpd php project/spark db:seed Run

mongo-clear:
	cd docker && docker-compose exec -T mongo mongo -u root -p root  --eval \"db=db.getSiblingDB('project');db.dropDatabase();\"

db-reset:
	make mysql-clear && make mysql-init && make mongo-clear

status:
	cd docker && docker-compose ps
show-config:
	cd docker && docker-compose config

sh:
	cd docker && docker-compose exec httpd /bin/bash
shroot:
	cd docker && docker-compose exec -u root httpd /bin/bash
