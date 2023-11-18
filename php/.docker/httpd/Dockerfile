FROM php:8.1-apache

USER root

#install software and libs
RUN apt clean >/dev/null 2>&1 && apt update -y >/dev/null 2>&1
RUN apt -y install nano wget curl less htop zip git npm \
    libbz2-dev \
    zlib1g-dev \
    libpng-dev \
    libgmp-dev \
    libicu-dev \
    libsodium-dev \
    imagemagick \
    libmagickwand-dev \
    libzip-dev >/dev/null 2>&1
#install php extensions
RUN docker-php-source extract
RUN docker-php-ext-install bcmath bz2 gd gmp intl pdo_mysql mysqli sodium zip  >/dev/null 2>&1
RUN echo '' | pecl install imagick mongodb psr >/dev/null 2>&1
RUN docker-php-ext-enable imagick mongodb psr >/dev/null 2>&1
RUN docker-php-source delete

#apache2 modules
RUN a2enmod rewrite vhost_alias >/dev/null 2>&1

#composer
COPY composer-install.sh composer-install.sh
RUN /bin/bash composer-install.sh >/dev/null 2>&1
RUN mv composer.phar /usr/local/bin/composer.phar
RUN ln -s /usr/local/bin/composer.phar /usr/local/bin/composer
RUN rm composer-install.sh

#phpmyadmin
RUN composer create-project phpmyadmin/phpmyadmin >/dev/null 2>&1
COPY pma-config.php phpmyadmin/config.inc.php
COPY phpmyadmin.conf /etc/apache2/sites-enabled/phpmyadmin.conf

#mongo-gui
RUN git clone https://github.com/arunbandari/mongo-gui.git >/dev/null 2>&1
RUN npm i --prefix mongo-gui >/dev/null 2>&1

#project
RUN mkdir project
RUN chmod -R g+x project
COPY project.conf /etc/apache2/sites-enabled/project.conf

#start script
COPY start.sh start.sh

EXPOSE 8090
EXPOSE 3131
EXPOSE 3232

CMD ["/bin/bash", "start.sh"]
