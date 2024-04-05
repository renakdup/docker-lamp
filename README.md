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