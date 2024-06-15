# Install WordPress in a container using podman-compose

Just my notes on setting up wordpress using containers. 

## Setup Podman

TODO


## Create compose file

TODO: find wordpress container using nginx/php-fpm instead of apache/mod-php.

```
---
version: '3.1'
services:
  db:
    image: docker.io/mariadb:latest
    volumes:
      - $HOME/mariadb/data:/var/lib/mysql:Z
    ports:
      - 3306:3306
    environment:
      MARIADB_ROOT_PASSWORD: badpassword
      MARIADB_DATABASE: test
      MARIADB_USER: test
      MARIADB_PASSWORD: test
    restart: always
  adminer:
    image: docker.io/adminer
    restart: always
    ports:
      - 8080:8080
  wordpress:
    image: docker.io/wordpress:latest
    volumes:
      - $HOME/somedirectory/html:/var/www/html:Z
    restart: always
    environment:
      WORDPRESS_DB_NAME: test
      WORDPRESS_DB_USER: test
      WORDPRESS_DB_PASSWORD: test
      WORDPRESS_DB_HOST: db
    ports:
      - 8082:80
```

# Install

Run podman-compose against file compose-file.yml starting the services and demonizing.

```
podman-compose -f componse-file.yml up -d
```