ARG PHP_VER

FROM php:${PHP_VER}-fpm

LABEL version="0.2"
LABEL maintaner="Andrei Pisarevskii <renakdup@gmail.com>"
LABEL source_url="https://github.com/renakdup/"

ARG COMPOSER_VER
ARG UID
ARG GUID
ARG USER=www-data

ENV PHP_EXTENSIONS_DISABLE='xdebug,xhprof';

# Configuring OS
RUN set -xe; \
    \
	usermod -u ${UID} ${USER}; \
    groupmod -g ${GUID} ${USER}; \
    \
    # Create necessary files
    touch /etc/msmtprc; \
    cp ${PHP_INI_DIR}/php.ini-development ${PHP_INI_DIR}/php.ini;
    #cp /usr/src/php/php.ini-production "${PHP_INI_DIR}/php.ini"; \

# OS Utilities
RUN set -xe; \
    apt-get update; \
    apt-get -y install \
      libpng-dev \
      libonig-dev \
      libxml2-dev \
      libzip-dev \
      tree \
      vim \
      nano \
      unzip \
      zip \
      tar \
      gzip \
      wget \
      curl \
      git \
      rsync \
      netcat-traditional \
      msmtp \
      # sendmail alias to msmtp
      msmtp-mta

# PHP Extensions
RUN set -xe; \
    curl -sSLf \
        -o /usr/local/bin/install-php-extensions \
        https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions && \
    chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions \
      gmagick \
      gd \
      mysqli \
      pdo \
      #pdo_pgsql \
      #pgsql \
      pdo_mysql \
      mbstring \
      tokenizer \
      opcache \
      exif \
      zip \
      xdebug \
      xhprof \
      pcov

# Should go after PHP Extentions because packages creates *.ini files whome permissions needs override.
RUN set -xe; \
    # Change permissions
    chown -R ${USER}:${USER}  \
      ${PHP_INI_DIR}/conf.d/ \
      /var/www \
      /etc/msmtprc; \
    echo 'alias ll="ls -la --color"' >>  /etc/bash.bashrc

# Templater
RUN curl -sL https://github.com/wodby/gotpl/releases/download/0.3.3/gotpl-linux-amd64.tar.gz | tar xz -C /usr/local/bin

# Install Composer
RUN wget https://getcomposer.org/download/${COMPOSER_VER}/composer.phar && \
    chmod +x composer.phar && \
    mv composer.phar /usr/local/bin/composer

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/
USER ${USER}

COPY templates /etc/gotpl/
COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["php-fpm"]