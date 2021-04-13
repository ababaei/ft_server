#Script de demarrage du stack LEMP

mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.crt -subj "/C=FR"

#################### NGINX #####################
if [ "$NGINX_AUTOINDEX" == "false" ]; then
	sed -i 's/autoindex on;/autoindex off;/g' /etc/nginx/sites-available/nginx_conf
fi

mkdir /var/www/localhost
ln -s /etc/nginx/sites-available/nginx_conf /etc/nginx/sites-enabled/
chown -R www-data:www-data /var/www/localhost/*
chmod -R 755 /var/www/localhost/*

##################### MYSQL ####################
service mysql start
echo "CREATE DATABASE wordpress_db;" | mysql -u root
echo "GRANT ALL ON wordpress_db.* TO 'ARVIN'@'localhost' IDENTIFIED BY 'TOTO';" | mysql -u root
echo "update mysql.user set plugin = 'mysql_native_password' where user='root';" | mysql -u root
echo "FLUSH PRIVILEGES" | mysql -u root

##################### PHPMYADMIN ######################
mkdir /var/www/localhost/phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz
tar xvf phpMyAdmin-5.1.0-english.tar.gz --strip-components 1 -C /var/www/localhost/phpmyadmin
mv ./config.inc.php /var/www/localhost/phpmyadmin

##################### WORDPRESS ################
wget https://wordpress.org/latest.tar.gz
tar xvf latest.tar.gz --strip-components 1 -C /var/www/localhost/wordpress
rm latest.tar.gz
chown -R www-data:www-data /var/www/localhost/wordpress
chmod -R 755 /var/www/localhost/*

service nginx start
service php7.3-fpm start
service mysql restart
sleep infinity
