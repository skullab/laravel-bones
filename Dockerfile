FROM php:7.4-apache
# UPDATE & UPGRADE
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
    # https://packages.debian.org/stretch/g++
    g++ \ 
    # https://packages.debian.org/sid/libicu-dev
    libicu-dev \
    # https://packages.debian.org/buster/libpq-dev
    libpq-dev \
    # https://packages.debian.org/stretch/libzip-dev
    libzip-dev \
    # https://packages.debian.org/sid/zip
    zip \
    # https://packages.debian.org/stretch/unzip
    unzip \
    # https://packages.debian.org/buster/zlib1g-dev
    zlib1g-dev \
    # https://packages.debian.org/testing/web/curl
    curl \
    # https://nodejs.org/en/
    nodejs \
    # https://www.npmjs.com/
    npm

# PHP EXTENSIONS
# mysqli (backward compatibility)
# https://www.php.net/manual/en/book.mysqli.php
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
# MySQL
# https://www.php.net/manual/en/ref.pdo-mysql.php
RUN docker-php-ext-install pdo_mysql && docker-php-ext-enable pdo_mysql
# PostgreSQL and Utils
RUN docker-php-ext-install \
    # https://www.php.net/manual/en/book.intl.php
    intl \
    # https://www.php.net/manual/en/book.opcache.php
    opcache \
    # https://www.php.net/manual/en/book.pdo.php
    pdo \
    # https://www.php.net/manual/en/ref.pdo-pgsql.php
    pdo_pgsql \
    # https://www.php.net/manual/en/book.pgsql.php
    pgsql

# BCMatch dependency for Laravel
# https://www.php.net/manual/en/book.bc.php
RUN docker-php-ext-install bcmath && docker-php-ext-enable bcmath

# INSTALL PHP COMPOSER
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Work directory
WORKDIR /var/www/laravel

# Change user permission and enable mod_rewrite
RUN chown -R www-data:www-data /var/www/laravel && a2enmod rewrite
