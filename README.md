# dockserv



### What is this?

This is a quick & dirty docker-webhosting solution with extra security provided by bunkerized nginx. i am sometimes in need of setting up some application on a small vps, vm or baremetal server - and needed a extra layer of security.

The extra security comes from the very flexible and configurable bunkerized nginx images. Ratelimiting, Badbehaviour, Modsecurity and crowdsec will help to protect your website from bad actors spending your precious resources. More info on bunkerized nginx can be found here : https://github.com/bunkerity/bunkerized-nginx 

Setting up certain applications can be tricky, and need special configuration tweaks. This repository with examples should make it easier to deploy these applications.


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


In the example directory there are several examples, preconfigured to work out of the box.


 - examples/php-fpm-simple/  a simple example of a minimalistic php-fpm application
 - examples/prestashop-apache/  a example using the bitnami-prestashop container.
 - examples/prestashop-nginx/   a example using the prestashop-fpm container.





