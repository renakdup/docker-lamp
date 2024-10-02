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

### Mailhog
Available by the link http://localhost:8025/

### Xdebug
Make sure you have `PHP_EXTENSIONS_DISABLE` env var overridden in your docker-compose file to enable Xdebug.

## Roadmap
- [x] Implemented working LAMP
- [x] Add mailhog
- [ ] Chose right server name
- [ ] Add xdebug
- [ ] Add xhprof
- [ ] Add ability to disable xhprof, xdebug
- [ ] Add SSL
- [ ] Add special nginx configs for WP Multisite, WP Single site
- [ ] Write documentation
