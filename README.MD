# LARAVEL-BONES

Laravel docker configuration

Basic configuration includes :
- Apache 2
- PHP 7.4 ( 8.x )
- MySQL or PostgreSQL
- Laravel 7.x ( 8.x )

Includes PHP Composer
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

Set **.env** variables for database connection and which db to use in **docker-compose.yml** file.

Then build and up the container.
```bash
docker-compose up -d --build
```

