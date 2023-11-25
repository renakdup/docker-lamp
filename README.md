# Docker LAMP 

1. Install Docker
2. Clone this repository 
3. Perform following commands
   - `cp .env.example .env`
   - `make d.compose.up`

4. You can create a directory for you site inside `sites` folder like:
    ```
   sites/
      lamp.loc/
      docker-lamp.loc/
      example.loc/
   ```
5. Add in the host file the same domain  
   `127.0.0.1 	lamp.loc`