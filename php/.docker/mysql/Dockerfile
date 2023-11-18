FROM mariadb:latest

USER root

ENV MARIADB_ALLOW_EMPTY_ROOT_PASSWORD true

COPY init.sql init.sql
COPY reset.sh reset.sh
