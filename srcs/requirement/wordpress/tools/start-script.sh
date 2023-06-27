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

	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	wp core install --admin_user=rooty --admin_email=rooty@gmail.com --url=http://jaemjeon.42.fr --title=helloMyWorld
	wp user create jaemjeon jaemjeon@gmail.com --role=author
	wp user update 1 --user_pass=$WORDPRESS_DB_USER
fi
chown -R www-data:www-data /var/www/html
exec php-fpm7.4 -F
