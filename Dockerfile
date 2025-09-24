# 1) Composer
FROM composer:2 AS composer-build
WORKDIR /src
COPY composer.json composer.lock ./
RUN composer install
COPY . .

# 2) Node
FROM node:20 AS frontend-build
WORKDIR /src
COPY . .
RUN if [ -f package-lock.json ]; then npm ci; else npm install; fi
RUN npm run build || true

# 3) Final
FROM nextcloud:31-apache
WORKDIR /usr/src/nextcloud
COPY --chown=www-data:www-data --from=composer-build /src/ /usr/src/nextcloud/
COPY --chown=www-data:www-data --from=frontend-build /src/core/js /usr/src/nextcloud/core/js
