#!/bin/bash


if test -f /srv/www/wp-config.php; then
    echo "Wp already exists"
else
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar 


    mv wp-cli.phar /usr/local/bin/wp 

    wp core download --allow-root ;
    
    wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb  --allow-root && 

    wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_EMAIL --allow-root &&

    wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --allow-root
fi

php-fpm7.4 --nodaemonize
