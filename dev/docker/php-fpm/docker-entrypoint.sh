#!/bin/bash

set -x

_gotpl() {
  if [[ -f "/etc/gotpl/$1" ]]; then
      gotpl "/etc/gotpl/$1" > "$2"
  fi
}

prepare_file_structure() {
  mkdir -p ${PHP_XDEBUG_OUTPUT_DIR}
}

process_templates() {
  _gotpl "docker-php.ini.tmpl" "${PHP_INI_DIR}/conf.d/docker-php.ini"
  _gotpl "docker-php-ext-xdebug.ini.tmpl" "${PHP_INI_DIR}/conf.d/docker-php-ext-xdebug.ini"


  #_gotpl "docker-php-ext-xhprof.ini.tmpl" "${PHP_INI_DIR}/conf.d/docker-php-ext-xhprof.ini"
  #_gotpl "docker-php-ext-pcov.ini.tmpl" "${PHP_INI_DIR}/conf.d/docker-php-ext-pcov.ini"
  #_gotpl "docker-php-ext-opcache.ini.tmpl" "${PHP_INI_DIR}/conf.d/docker-php-ext-opcache.ini"

  _gotpl "msmtprc.tmpl" "/etc/msmtprc"
}

process_templates
prepare_file_structure
#disable_modules

set +x

# Run general command
exec "$@"