# Docker LAMP
1. Run the following commands
    - `cp .env.example .env`
    - `make d.up`

2. You can create a directory for you site inside `sites` folder like:
    ```
   sites/
      lamp.loc/
      docker-lamp.loc/
      example.loc/
   ```
3. Add in the host file the same domain  
   `127.0.0.1 	lamp.loc`

### Helpful commands
```bash
# Run project
make d.up

# Build all containers
make d.build.all
# Just one
make d.build nginx

# Recreate containers
make d.force-recreate.all
# Just one
make d.force-recreate php

# Connect to containers
make php.connect
make nginx.connect
make mysql.connect

# Connect to MySQL client
make mysql.client.connect
```

#### Logs
```bash
# PHP logs
make php.logs

# Nginx logs
make nginx.logs
```

### PHP
PHP can be configured by changing *.ini files:  
```
./dev/docker/php-fpm/configs/ini/*.ini
```
**After changing you don't need to build image again, just force-recreate it**

```bash
make d.force-recreate php
```

### Mail sending & Mailhog
MailHog service is available by the link http://localhost:8025/

You can read more about [sending email from Docker](https://wp-yoda.com/okruzhenie/otpravka-pochty-iz-docker-ispolzuem-mailhog/) by the link.

Config of SMTP client could be change `dev/docker/php-fpm/configs/msmtprc`

### Xdebug
Install Xdebug helper Chrome extension and choose mode of xdebug do you want to run.

_All trace/profile/etc files will be available by `./tmp/xdebug` path._

#### Run Xdebug via console
- Run debug mode
    ```
    XDEBUG_MODE=trace XDEBUG_TRIGGER=1 php index.php
    ```
- Run profiling mode
    ```
    XDEBUG_MODE=profile XDEBUG_TRIGGER=1 php index.php
    ```
- Run trace mode
    ```
    XDEBUG_MODE=trace XDEBUG_TRIGGER=1 php index.php
    ```

## Roadmap
- [x] Implemented working LAMP
- [x] Add mailhog
- [x] Add xdebug
  - [x] Profiler
  - [x] Debug
  - [x] Trace
  - [ ] Add default const to pass xdebug settings
- [ ] Chose right server name
- [ ] Add xhprof
- [ ] Add SSL
- [ ] Add special nginx configs for WP Multisite, WP Single site
- [x] Write documentation
- [ ] Fix error with connection to mysql via WordPress user.
- [ ] Add ability to disable xhprof, xdebug
