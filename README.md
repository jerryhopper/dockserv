# dockserv



### What is this?

This is a quick & dirty docker-webhosting solution with extra security. i am sometimes in need of setting up some application on a small vps, vm or baremetal server - and needed a extra layer of security.


### Quick install

<pre>
curl -s https://raw.githubusercontent.com/jerryhopper/dockserv/master/setup.sh | sudo bash -s 
</pre>



### Usage

<pre>
Usage: dockserv <options>

 dockserv [-c <app>] [-b] [-d <folder>] [-R]
  -c <application> : the CREATE flag. example:  -c <prestashop|wordpress|nginx|swoole74>
  -b : the BACKUP flag. 
  -d <directory> : the DIRECTORY flag. if -d is not specified, the current directory will be assumed.
  -R : the REMOVAL flag. 
  -F : Force 'yes' on all input. (allows removal without interaction)
  -i <backupfile> : Import backupfile 
  -h <hostname> : specifies hostname to use: mydomain.com or mydomain.com,www.myotherdomain.com

 Installation:
   dockserv install email@ddr.es  <-F>
   dockserv uninstall <-F>

   dockserv downloadbackup  - Allows downloading backupfiles from backup archive
</pre>


<pre>
dockserv -d /some/location/some/nginx -c nginx  -h nginx.local
dockserv -d /some/location -c swoole74  -h localhost
dockserv -d /some/location/some/wordpress -c wordpress  -h wordpress.local
dockserv -d /some/location/some/prestashop -c prestashop  -h prestashop.local
</pre>


