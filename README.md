# dockserv



## What is this?

this is a quick & dirty docker-webhosting solution.

## How to use

Obviously you'll need a server of some kind, and grab this repo.

Create a .env file based on the example.env

``cp ./example.env ./.env``

Edit the file, and save it.

``nano .env``

Run the following command to start the reverse proxy server (Bunkerized-nginx)

``sudo ./docker-compose up -d``


