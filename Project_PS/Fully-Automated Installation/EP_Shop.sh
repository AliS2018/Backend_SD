#!/bin/bash

##Add Key for a Server and Repository of a Docker

apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

##Add Docker Repository

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
apt update
apt install docker-ce -y

##Install docker-compose

curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
clear
echo " << DONE >> "
echo " Enabling Containers... "
cd ~/
docker-compose -f prestashop.yml up -d
docker-compose -f database.yml up -d
sleep 5
echo "Container: prestashop_b1c0sl enabled... "
sleep .1
echo "Proceed with Internal Setup at 127.0.0.1:8080"
sleep .2
echo ">> DB name: prestashop || >> DB user: prestoadmin || >> DB Pass: 12345aA."
sleep 10
      echo "Setup Complete!"
      sleep 2
      echo "Exitting..." 
        sleep 4
exit 0
