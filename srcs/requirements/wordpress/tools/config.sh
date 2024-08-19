cd /etc/php83/php-fpm.d/
sed -i "s/127.0.0.1://g" www.conf
sed -i "s/;clear/clear/g" www.conf

cd /var/www/wordpress
if [ -e wp-config-sample.php ]; then
	sed -i "s/'database_name_here'/'$SQL_DB'/g" wp-config-sample.php
	sed -i "s/'username_here'/'$SQL_USR'/g" wp-config-sample.php
	sed -i "s/'password_here'/'$SQL_PW'/g" wp-config-sample.php
	sed -i "s/'localhost'/'mariadb:3306'/g" wp-config-sample.php
	sed -i "59i define( 'WP_REDIS_HOST', 'redis' );" wp-config-sample.php
	sed -i "60i define( 'WP_REDIS_PORT', 6379 );" wp-config-sample.php
	sed -i "61i define( 'WP_CACHE', true );" wp-config-sample.php
	mv wp-config-sample.php wp-config.php

	sleep 3

	wp-cli core install --url=$DOM_NAME/ \
						--title=$SITE_TITLE\
						--admin_user=$WP_ADMINNAME\
						--admin_password=$WP_ADMINPASS\
						--admin_email=$WP_ADMINMAIL\
						--skip-email\
						--allow-root
	wp-cli user create	$WP_USER\
						$WP_MAIL\
						--user_pass=$WP_USERPASS\
						--role=author\
						--allow-root
	wp-cli plugin install redis-cache\
						--activate\
						--allow-root
fi

wp-cli plugin update\
					--all\
					--allow-root
wp-cli redis enable --allow-root

php-fpm83 -F
