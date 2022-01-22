

This is a example of a simple php-fpm application that uses the reversed proxy to serve its files.

the application's hostname:  app1.example.com

The webserver needs some extra instruction in order to use the default index document.

For this to happen, you need to create these specific instructions in the server-confs directory of the reversed proxy. The example is included in  /server-confs/app1.example.com/permalinks.conf



