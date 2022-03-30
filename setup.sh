#!/bin/bash




# this assumes sudo is installed.
# this assumes docker-compose is installed.
# apt install docker-compose

# Check if user is root.
if (( $EUID != 0 )); then
    echo " You need to be root!"
    exit
fi

# Make sure dockserv is executable
chmod +x $PWD/bin/dockserv


echo "PATH=\"$PATH:$PWD/bin\""> /tmp/environment
sudo cp -f /tmp/environment /etc/environment

# Create softlinks so binary is accessible
#sudo ln -s $PWD/bin/dockserv /usr/bin/dockserv
#chmod +x /usr/bin/dockserv

# Check if docker is installed.
if ! foobar_loc="$(type -p "docker")" || [[ -z $foobar_loc ]]; then
  # install foobar here
  echo install docker
  sudo apt-get install docker-compose -y
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
    sudo useradd -m dockserve
    sudo passwd dockserve
    sudo usermod -aG docker dockserve

fi
echo "-----------------------"
echo "usage:   dockserve --help"
