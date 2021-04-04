From debian

RUN apt-get -y update && apt-get -y install nginx \
	mariadb-server \
	wget
	
#RUN reboot

RUN service mysql start
RUN mysql
RUN create database My_Database
RUN	create user 'ARVIN'@'localhost' identified by 'TOTO'
RUN	grant all privileges on My_Database.* TO 'ARVIN'@localhost' identified by 'TOTO'
RUN flush privileges

COPY index.html /var/www/index.html
COPY default /etc/nginx/sites-available/default

EXPOSE 80/tcp

CMD usr/sbin/nginx && tail -f /dev/null
