cd /var/www/inception

wp core download --path="/var/www/inception" --allow-root

wp config create --path="/var/www/inception" --dbhost=$MDB_HOST --dbname=$MDB_DBNAME --dbuser=$MDB_USER --dbpass=$MDB_USER_PASS --dbprefix=wp_ --allow-root

wp core install --path="/var/www/inception" --title="Inception" --url=$URL --admin_email=$MDB_ROOT_EMAIL --admin_user=$MDB_ROOT_USER --admin_password=$MDB_ROOT_PASS --allow-root 

wp plugin update --all --allow-root

wp user create --path="/var/www/inception" $WP_USER $WP_EMAIL --user_pass=$WP_USER_PASS --allow-root

chown www-data:www-data /var/www/inception/wp-content/uploads -R

mkdir -p /run/php/

php-fpm7.3 -F
