FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install curl less php php-fpm php-mysql php-mysqli mariadb-client -y

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/inception/wordpress

EXPOSE 9000

COPY /tools/entrypoint.sh /tmp
COPY /conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]

CMD ["php-fpm7.3", "-F"]