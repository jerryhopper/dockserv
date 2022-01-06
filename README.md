# dockserv



## What is this?

this is a quick & dirty docker-webhosting solution with automated backup functionality

## How to use

Obviously you'll need a server of some kind, and grab this repo.

Create a .env file based on the example.env

``cp ./example.env ./.env``

Edit the file, and save it.

``nano .env``

Run the following command to start the reverse proxy server (Bunkerized-nginx)

``sudo ./docker-compose up -d``

We now have the reverse-proxy up and running, lets start a website!

Go to the Examples/ directory, and choose the application you like to start - Checkout the prestashop example.

