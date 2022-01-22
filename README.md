# dockserv



### What is this?

This is a quick & dirty docker-webhosting solution with extra security provided by bunkerized nginx. i am sometimes in need of setting up some application on a small vps, vm or baremetal server - and needed a extra layer of security.


## How to use/setup the reverse proxy

Obviously you'll need a server of some kind, and grab this repo.

Create a .env file based on the example.env

``cp ./example.env ./.env``

Edit the file, and save it.

``nano .env``

Run the following command to start the reverse proxy server (Bunkerized-nginx)

``sudo ./docker-compose up -d``

We now have the reverse-proxy up and running, lets start a website!

Go to the Examples/ directory, and choose the application you like to start - Checkout the prestashop example.

## Setting up a application behind the reverse proxy


In the example directory there are several examples.


