version: "3"

services:
  # Webserver
  webserver:
    image: "webserv:latest"
    container_name: "webserver_utama"
    restart: 'always'
    ports:
      - "${HOST_PORT}:80"
    volumes: 
      - ${DOCUMENT_ROOT}:/var/www/html
      - ${VHOSTS_DIR}:/etc/apache2
      - ${APACHE_LOG_DIR}:/var/log/apache2


  # Database Server
  mysql:
    image: "mariadb:10.4"
    container_name: "database_utama"
    restart: 'always'
    ports:
      - "${DB_PORT}:3306"
    volumes: 
      - ${MYSQL_DATA_DIR}:/var/lib/mysql
      - ${MYSQL_LOG_DIR}:/var/log/mysql
    environment:
      - MYSQL_ROOT_PASSWORD:${MYSQL_ROOT_PASSWORD}

  # Networking

