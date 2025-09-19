
FROM nextcloud:31-apache


COPY --chown=www-data:www-data . /usr/src/nextcloud/

# (Optional) If you add custom PHP ini or opcache tweaks, drop them here:
# COPY ./docker/php/conf.d/*.ini /usr/local/etc/php/conf.d/

# Nothing else is required; we keep the upstream entrypoint and hooks.
