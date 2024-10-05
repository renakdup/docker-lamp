#!/bin/bash


prepare_file_structure() {
  mkdir -p /var/www/tmp/xdebug
  mkdir -p /var/www/tmp/xhprof
}

load_configs() {
  cp /etc/docker-php-configs/ini/docker-php.ini ${PHP_INI_DIR}/conf.d/docker-php.ini
  cp /etc/docker-php-configs/ini/docker-php-ext-xdebug.ini ${PHP_INI_DIR}/conf.d/docker-php-ext-xdebug.ini
  cp /etc/docker-php-configs/ini/docker-php-ext-xhprof.ini ${PHP_INI_DIR}/conf.d/docker-php-ext-xhprof.ini
  cp /etc/docker-php-configs/ini/docker-php-ext-pcov.ini ${PHP_INI_DIR}/conf.d/docker-php-ext-pcov.ini
  cp /etc/docker-php-configs/ini/docker-php-ext-opcache.ini ${PHP_INI_DIR}/conf.d/docker-php-ext-opcache.ini

  cp /etc/docker-php-configs/msmtprc /etc/msmtprc
}

load_configs
prepare_file_structure
#disable_modules


# Run general command
exec "$@"