FROM php:8.4-cli-alpine

LABEL "repository"="https://github.com/bobbyiliev/ibis-build-action"
LABEL "homepage"="https://github.com/bobbyiliev/ibis-build-action"
LABEL "maintainer"="Bobby Iliev"

ENV COMPOSER_HOME=/tmp

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install PHP modules and Ibis Next
RUN apk add --no-cache php8-iconv php8-mbstring php8-openssl php8-gd php8-zip git \
    && composer global require hi-folks/ibis-next

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]