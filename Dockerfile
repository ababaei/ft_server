From debian

RUN apt-get -y update && apt-get -y install nginx \
	default-mysql-server
	
COPY index.html /var/www/index.html
COPY default /etc/nginx/sites-available/default

EXPOSE 80,443/tcp

CMD usr/sbin/nginx && tail -f /dev/null
