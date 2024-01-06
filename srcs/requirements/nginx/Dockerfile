FROM debian:bullseye

RUN apt-get update \
    && apt-get install -y nginx openssl

RUN openssl req -x509 -nodes -keyout /etc/nginx/okrich.key -out /etc/nginx/okrich.crt -subj "/C=/ST=/L=/O=/OU=/CN=localhost"

RUN mkdir -p /srv/www

RUN chown -R www-data:www-data /srv/www

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

CMD ["nginx" , "-g daemon off;"]