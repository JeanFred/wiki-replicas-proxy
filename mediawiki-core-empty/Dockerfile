FROM mariadb:10.0

ENV SQL_SCHEMA https://raw.githubusercontent.com/wikimedia/mediawiki/master/maintenance/tables.sql

ADD $SQL_SCHEMA /docker-entrypoint-initdb.d/

RUN chmod -R 775 /docker-entrypoint-initdb.d/
