#!/bin/bash


if test -f /srv/www/wp-config.php; then
    echo "Wp already exists"
else
    wp core download --allow-root ;
    
    while ! mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -h mariadb -e "use $MYSQL_DATABASE" 2> /dev/null
    do
        echo "Waiting for database to be created;"
    done

    wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb  --allow-root && 

    wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_EMAIL --allow-root &&

    wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --allow-root
fi

php-fpm7.4 --nodaemonize