FROM debian:bullseye

RUN apt-get update \
    && apt-get install -y \
    && apt-get install -y php8.2-fpm \
    && apt-get install -y php-mysql \
    && apt-get install -y mariadb-client \
    && apt-get install -y wget \
    && apt-get clean

# COPY file.conf para o php

WORKDIR /var/www
RUN wget https://wordpress.org/wordpress-6.3.tar.gz -P .
RUN tar -xzf wordpress-6.3.tar.gz && rm -rf wordpress-6.3.tar.gz
RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# COPY arquivo .sh para configurar o wordpress
# RUN permissoes de execução do arquivo .sh

EXPOSE 9000

# Executando o arquivo .sh
# ENTRYPOINT [ "bash", "/usr/local/bin/wordpress_setup.sh" ]