#!/bin/bash

# this assumes sudo is installed.
# this assumes docker-compose is installed.
# apt install docker-compose

if (( $EUID != 0 )); then
    echo " You need to be root!"
    exit
fi

chmod +x $PWD/bin/dockserv
sudo ln -s $PWD/bin/dockserv /usr/bin/dockserv
chmod +x /usr/bin/dockserv


if ! foobar_loc="$(type -p "docker")" || [[ -z $foobar_loc ]]; then
  # install foobar here
  echo install docker
  sudo apt-get install docker-compose -y
fi


if [ $(getent group docker) ]; then
  echo "group exists."
else
  echo "group does not exist."
fi



if id "dockserve" &>/dev/null; then
    echo 'user dockserve found.'
    
else
    echo 'Creating user dockserve.'
    sudo useradd -m dockserve
    sudo passwd dockserve
    sudo usermod -aG docker dockserve
    
fi


#  export PATH="/home/jerryhopper/dockserv/bin:$PATH"
#  /home/dockserve/.bashrc
#  export PATH="$HOME/dockserv/bin:$PATH"

#sudo echo "export PATH=\"$PWD/bin:\$PATH\" >> /home/dockserve/.bashrc"


# this assumes

