# PHP-BONES

A skeleton docker configuration for Apache - PHP - MYSQL Container<br>
Includes PHP Composer
## Usage

From terminal
```bash
docker-compose build
docker-compose up
```

## Connect to container bash terminal

Show container's list
```bash
docker ps
```
Find the container id in the list and then
```bash
docker exec -it <container-id> bash
```