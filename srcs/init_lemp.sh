#Script de demarrage du stack LEMP

#################### INSTALL ##################
apt-get -y update && apt-get -y install nginx \
	mariadb-server mariadb-client \
	php-fpm php-mysql \
	wget
	
#################### NGINX #####################
mkdir /var/www/localhost
chown -R $USER:$USER /var/www/localhost
ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

##################### MYSQL ####################
service mysql start
echo "CREATE DATABASE mydb;" | mysql -u root
echo "GRANT ALL ON mydb.* TO 'ARVIN'@'localhost' IDENTIFIED BY 'TOTO';" | mysql -u root
echo "FLUSH PRIVILEGES" | mysql -u root

##################### PHP ######################


##################### WORDPRESS ################

service nginx start
service php-fpm start
service mysql restart
sleep infinity
