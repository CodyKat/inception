#!/bin/sh
if [ -f /var/www/html/wp-config.php ]
then
	echo wordpress already installed
else
	wget https://wordpress.org/latest.tar.gz
	tar -xf latest.tar.gz
	mv wordpress/* /var/www/html/
	rm -rf wordpress latest.tar.gz

	sed -i "s/username_here/$WORDPRESS_DB_USER/g" wp-config-sample.php
	sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$WORDPRESS_DB_HOST/g" wp-config-sample.php
	sed -i "s/database_name_here/$WORDPRESS_DB_NAME/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php
fi
chown -R www-data:www-data /var/www/html
exec php-fpm7.4 -F
