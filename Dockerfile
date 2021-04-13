From debian:buster

RUN apt-get -y update && apt-get -y install nginx \
	mariadb-server mariadb-client \
	php-fpm php php-cgi php-mysqli php-pear php-mbstring php-gettext libapache2-mod-php php-common php-phpseclib php-mysql \
	openssl \
	wget

COPY srcs ./
COPY srcs/wp-config.php /var/www/localhost/wordpress/wp-config.php
COPY srcs/nginx_conf /etc/nginx/sites-available/nginx_conf
COPY index.html /var/www/localhost/index.html
COPY info.php /var/www/localhost/info.php

RUN	mkdir /var/www/localhost/test && cd /var/www/localhost/test
RUN touch details.html

EXPOSE 80/tcp

CMD bash /init_lemp.sh
