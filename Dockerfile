FROM nextcloud:31-apache

COPY --chown=www-data:www-data . /usr/src/nextcloud/

RUN composer install && \
    npm install
