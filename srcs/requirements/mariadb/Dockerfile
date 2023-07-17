FROM debian:buster

RUN	apt-get update -y
RUN	apt-get upgrade -y
RUN	apt-get install -y mariadb-server

RUN mkdir -p /run/mysqld
RUN chown -R mysql:mysql /run/mysqld
RUN chmod 777 /var/run/mysqld

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/start.sh /

EXPOSE 3306

ENTRYPOINT ["sh", "start.sh"]

CMD ["mysqld_safe"]
