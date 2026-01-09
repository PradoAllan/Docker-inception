#!/bin/bash

USER=aprado

touch .env

echo "env file got created!"
echo "writing up the credentials..."

echo "SERVER_NAME=$USER.42.fr

DB_HOST=mariadb
DB_NAME=wordpress
DB_USER=wpuser

WP_URL=https://$USER.42.fr
WP_TITLE=Inception

WP_ADMIN_USER=super_$USER
WP_ADMIN_EMAIL=allanprado.it@gmail.com

WP_USER2=$USER
WP_USER2_EMAIL=allan_prado_silva@hotmail.com
WP_USER2_ROLE=author" > .env

echo "credentials completed!"