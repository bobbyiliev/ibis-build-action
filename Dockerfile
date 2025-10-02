FROM composer:2.1.9
LABEL "repository"="https://github.com/bobbyiliev/ibis-build-action"
LABEL "homepage"="https://github.com/bobbyiliev/ibis-build-action"
LABEL "maintainer"="Bobby Iliev"

# Install PHP 7 and all required modules
RUN apk add php7 php7-phar php7-iconv php7-mbstring php7-json php7-openssl php7-gd
# Install Ibis
RUN php7 /usr/bin/composer global require themsaid/ibis

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]