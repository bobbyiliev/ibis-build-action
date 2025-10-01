FROM php:8.4-cli-alpine

LABEL "repository"="https://github.com/bobbyiliev/ibis-build-action"
LABEL "homepage"="https://github.com/bobbyiliev/ibis-build-action"
LABEL "maintainer"="Bobby Iliev"

ENV COMPOSER_HOME=/tmp

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install PHP modules and Ibis Next
RUN apk add --no-cache libpng-dev libjpeg-turbo-dev freetype-dev libzip-dev git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd zip \
    && composer global require hi-folks/ibis-next

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]