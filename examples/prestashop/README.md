# prestashop




Create a .env file based on the example.env

``cp ./example.env ./.env``

Edit the file, and save it.

``nano .env``

Run the following command to start the reverse proxy server (Bunkerized-nginx)

``sudo ./docker-compose up -d``

Now wait a moment for Prestashop to finish the installation, an for the AutoConf to see the changes and configures the reversed proxy.


