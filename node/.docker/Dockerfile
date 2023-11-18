FROM node:16.19-bullseye

USER root

RUN apt update >/dev/null 2>&1 && apt install micro -y >/dev/null 2>&1

#RUN npm install -g pnpm >/dev/null 2>&1

RUN rm /etc/localtime && ln -s /usr/share/zoneinfo/Europe/Warsaw /etc/localtime

RUN mkdir app
RUN chmod -R g+x app

COPY start.sh start.sh

USER node

ENV HOST 0.0.0.0

ENTRYPOINT ["docker-entrypoint.sh"]

CMD /bin/bash start.sh
