ARG PHP_VERSION=7.2-apache
FROM php:${PHP_VERSION}
LABEL Name=docker-self-service-password Version=0.0.1
RUN apt-get update && apt-get install --no-install-recommends -y \
        libsodium-dev \
        libldap-dev \
    && docker-php-ext-install ldap \
    && docker-php-ext-install sodium \
    && rm -r /var/lib/apt/lists/* \
    && echo "TLS_REQCERT allow" >> /etc/ldap/ldap.conf
ARG SSP_VERSION=1.3
ADD https://github.com/ltb-project/self-service-password/archive/v${SSP_VERSION}.tar.gz ./
RUN tar xzf v${SSP_VERSION}.tar.gz \
    && mv self-service-password-${SSP_VERSION}/* ./ \
    && rm -r self-service-password-${SSP_VERSION}/ v${SSP_VERSION}.tar.gz
