ARG PHP_VERSION=7.2-apache
ARG SSP_VERSION=1.3
FROM php:${PHP_VERSION}
LABEL Name=docker-self-service-password Version=0.0.1
RUN apt-get update && apt-get install --no-install-recommends -y \
        libsodium-dev \
        libldap-dev \
    && docker-php-ext-install ldap \
    && docker-php-ext-install sodium \
    && rm -r /var/lib/apt/lists/* \
    && echo "TLS_REQCERT allow" >> /etc/ldap/ldap.conf
ADD https://github.com/ltb-project/self-service-password/archive/v${SSP_VERSION}.tar.gz ./
RUN tar xzf v${Version}.tar.gz \
    && mv ${Name}-${Version}/* ./ \
    && rm -r ${Name}-${Version} v${Version}.tar.gz
