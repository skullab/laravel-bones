# LARAVEL-BONES

Laravel docker configuration

Basic configuration includes :
- Apache 2
- PHP 7.4 ( 8.x )
- MySQL or PostgreSQL
- PHP Composer

NOTE: Manual installation of Laravel using Composer

## Dependencies

OS
- g++
- libicu-dev
- libpq-dev
- libzip-dev
- zip
- zlib1g-dev

Web Server
- mysqli
- pdo ( pdo_mysql and pdo_pgsql)
- opcache
- intl
- bcmath
## Usage

This configuration use PHP v7.4 and Apache web server.

For more info or different configuration, visit official docker image
https://hub.docker.com/_/php/

Set **.env** variables for database connection and which db to use in **docker-compose.yml** file.
```env
MYSQL_ROOT_PASSWORD = root
MYSQL_DATABASE = laravel
MYSQL_USER = laravel
MYSQL_PASSWORD = password
````

```yml
# MYSQL
  db:
    container_name: mysql
    image: mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: "${MYSQL_ROOT_PASSWORD}"
      MYSQL_DATABASE: "${MYSQL_DATABASE}"
      MYSQL_USER: "${MYSQL_USER}"
      MYSQL_PASSWORD: "${MYSQL_PASSWORD}"
    ports:
      - 3306:3306
  # POSTGRESQL
  #db:
  #  container_name: postgres
  #  image: postgres
  #  restart: unless-stopped
  #  environment:
  #    POSTGRES_PASSWORD: "${POSTGRES_PASSWORD}"
  #    POSTGRES_DB: "${POSTGRES_DB}"
  #  volumes:
  #    - ./postgres-data:/var/lib/postgresql/data
  #  ports:
  #    - 5432:5432
```

Then build and up the container.
```bash
docker-compose up -d --build
```

Open web server terminal
```bash
docker exec -it php-apache bash
```

Install Laravel in the WORKDIR
```bash
composer create-project laravel/laravel .
```
Or a prefer distribution
```bash
composer create-project --prefer-dist laravel/laravel:^7.0 .
```
