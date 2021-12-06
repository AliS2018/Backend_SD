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

#echo "Disabling All Services and Files..."
#rm -rf /var/www/html/GDA.ORG
#apt remove apache2 -y
#apt purge apache2 -y
#apt remove php7.4-cli -y
#apt remove php7.4 -y
#apt remove php-zip -y
#apt remove php7.4-xml -y
#apt remove php7.4-curl -y
#apt remove php7.4-gd -y
#apt remove php7.4-mysql -y
#apt remove php-mbstring -y
#apt remove php-intl -y
#apt purge php7.4-cli -y
#apt purge php7.4 -y
#apt purge php-zip -y
#apt purge php7.4-xml -y
#apt purge php7.4-curl -y
#apt purge php7.4-gd -y
#apt purge php7.4-mysql -y
#apt purge php-mbstring -y
#apt purge php-intl -y
#dpkg -r docker-ce docker-ce-cli docker-ce-rootless-extras docker-scan-plugin
#dpkg --purge docker-ce
#apt autoremove -y
#echo "DONE!"
#clear

echo ">>Generating Temporary Files..."
sleep 2
mkdir -p /var/www/html/GDA.ORG
cd ~/
wget https://www.prestashop.com/en/system/files/ps_releases/prestashop_1.7.8.1.zip

echo ">>DONE<<"
clear

echo "Welcome to Prestashop Dependecy Installer Script"
sleep 5

clear
echo " >> Installing Apache2 <<"
apt update -y
apt upgrade -y
apt install apache2 -y
echo "DONE"
sleep 1

clear
echo ">> Installing PHP 7.4 <<"
sleep 1
apt install php7.4-cli -y
apt install php7.4 -y
clear
echo "php 7.4 installed"
apt install php-zip -y
clear
echo "php-zip module installed"
apt install php7.4-xml -y
clear
echo "php-xml module installed"
apt install php7.4-curl -y
clear
echo "php-curl module installed"
apt install php7.4-gd -y
clear
echo "php-gd library installed"
apt install php7.4-mysql -y
clear
echo "php-mysql driver installed"
apt install php7.4-mbstring -y
clear
echo "php mbstring module installed"
apt install php7.4-intl -y
clear
echo "php intl module installed"
echo "<< DONE >>"
sleep 3
clear
echo ">> Preparing environment... >>"
apt install unzip -y 
clear
sleep 5
echo "<< STOPPING SERVICES... >>"
systemctl stop apache2
echo "<< DONE >>"
 sleep 5
unzip prestashop_1.7.8.1.zip -d /var/www/html/GDA.ORG
rm -rf prestashop_1.7.8.1.zip
cd /var/www/html/GDA.ORG/
#unzip prestashop.zip -d /var/www/html/GDA.ORG
#rm -rf prestashop.zip
rm -rf /var/www/html/GDA.ORG/Install_Prestashop.html
rm -rf /var/www/html/index.html

echo "<< DONE >>"
sleep 1
echo ">> Granting permissions..."
sleep 1
chmod -R 777 /var/www/html/GDA.ORG/
echo "<< DONE >>"

echo ">> Starting services... "
systemctl start apache2
a2enmod rewrite
systemctl restart apache2
echo "<< DONE >>"

echo ">> Installing Docker ... >>"
sleep 1
clear

sleep 5

cd ~/
chmod +x Docker-Installer.sh
./Docker-Installer.sh