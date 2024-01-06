FROM debian:bullseye

RUN apt-get update && apt-get install -y php7.4-fpm php-mysql wget

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /srv/www && mkdir -p /run/php

RUN chown -R www-data:www-data /srv/www

WORKDIR /srv/www

COPY ./tools/setup.sh /

RUN chmod +x /setup.sh

CMD ["/setup.sh"]