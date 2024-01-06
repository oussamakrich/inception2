FROM debian:bullseye

RUN apt-get update && apt-get install -y php7.4-fpm php-mysql wget mariadb-client

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /srv/www && mkdir -p /run/php

RUN chown -R www-data:www-data /srv/www

RUN  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar 

RUN  mv wp-cli.phar /bin/wp 

WORKDIR /srv/www

COPY ./tools/setup.sh /

RUN chmod +x /setup.sh

CMD ["/setup.sh"]