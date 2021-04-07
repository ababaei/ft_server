From debian

COPY srcs ./
COPY index.html /var/www/localhost/index.html
COPY default /etc/nginx/sites-available/default
COPY info.php /var/www/localhost/info.php


EXPOSE 80/tcp

#CMD bash /init_lemp.sh
RUN chmod +x /init_lemp.sh && /init_lemp.sh
#RUN service mysql restart
#CMD usr/sbin/nginx && tail -f /dev/null
