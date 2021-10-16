FROM php:7.4-apache
# UPDATE & UPGRADE
RUN apt-get update && apt-get upgrade -y
# PHP EXTENSIONS
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN docker-php-ext-install pdo_mysql && docker-php-ext-enable pdo_mysql
RUN docker-php-ext-install bcmath && docker-php-ext-enable bcmath
# INSTALL COMPOSER
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
