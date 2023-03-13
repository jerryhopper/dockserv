#!/bin/bash

# Check if user is root.
if (( $EUID != 0 )); then
    echo " You need to be root!"
    exit
fi

if [ -f /tmp/dockserv.tar.gz ];then
  rm -rf /tmp/dockserv.tar.gz
fi

curl -L https://github.com/jerryhopper/dockserv/archive/refs/heads/master.tar.gz --output /tmp/dockserv.tar.gz

if [ ! -f /usr/lib/dockserv ]; then 
  sudo mkdir /usr/lib/dockserv
fi

sudo tar -zxvf /tmp/dockserv.tar.gz --overwrite --strip-components=1 --directory /usr/lib/dockserv

#sudo chown -R 

#exit




# this assumes sudo is installed.
# this assumes docker-compose is installed.
# apt install docker-compose




# Make sure dockserv is executable
chmod +x /usr/lib/dockserv/bin/dockserv


echo "PATH=\"$PATH:/usr/lib/dockserv/bin\""> /tmp/environment
sudo cp -f /tmp/environment /etc/environment

# Create softlinks so binary is accessible
sudo ln -s /usr/lib/dockserv/bin/dockserv /usr/bin/dockserv
chmod +x /usr/bin/dockserv





# Check if docker is installed.
if ! foobar_loc="$(type -p "docker")" || [[ -z $foobar_loc ]]; then
  # install foobar here
  echo install docker
  sudo apt-get install docker.io docker-compose -y
fi

# Check if group 'docker' exists.
if [ $(getent group docker) ]; then
  echo "group exists."
else
  echo "group does not exist."
fi


# Create user dockserve
if id "dockserve" &>/dev/null; then
    echo 'user dockserve found.'

else
    echo 'Creating user dockserve.'
    DPASS="$(< /dev/urandom tr -dc A-Z-a-z-0-9-! | head -c${1:-16};echo;)"
    sudo useradd -m dockserve
    sudo usermod --shell /bin/bash dockserve
    sudo chpasswd <<<"dockserve:$DPASS"
    #sudo chpasswd dockserve
    #sudo passwd dockserve
    sudo usermod -aG docker dockserve
    echo "Password: $DPASS"
    DPASS=""
fi
echo "-----------------------"
echo "usage:   dockserv --help"
