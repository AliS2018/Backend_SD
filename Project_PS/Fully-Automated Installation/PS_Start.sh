#!/bin/bash
## MEDIA.GDA.ORG
## GAMES.GDA.ORG
## LICENSES.GDA.ORG
## CONSCIOUSNESS.GDA.ORG
## BETA.GDA.ORG
## RECORDS.GDA.ORG
## FBI.GDA.ORG
## CRYPTO.GDA.ORG
## STATUS.GDA.ORG
## STORE.GDA.ORG
## GORE.GDA.ORG

echo "Welcome to Prestashop Dependecy Installer Script"
sleep 5

echo " >> Installing Docker..."
echo "Enable Internal Network Interface for PrestaShop"
sleep 1
#docker network create prestashop_network
clear

echo "Disabling old containers..."
docker stop prestashop_b1c0sl
docker stop db_mysql_all
docker system prune -a 
docker network prune 
echo ">> DONE <<"
echo "Removing old DB"
rm -rf /Volumes/PRESTADB
echo ">> DONE <<"
sleep 1

cd ~/
chmod +x EP_Shop.sh
./EP_Shop.sh

