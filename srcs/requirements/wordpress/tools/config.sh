cd /var/www/wordpress
sed -i "s/'database_name_here'/'$SQL_DATABASE'/g" wp-config-sample.php
sed -i "s/'username_here'/'$SQL_DATABASE'/g" wp-config-sample.php
sed -i "s/'password_here'/'$SQL_PASSWORD'/g" wp-config-sample.php
sed -i "s/'localgist'/'mariadb:3306'/g" wp-config-sample.php
mv wp-config-sample.php wp-config.php
