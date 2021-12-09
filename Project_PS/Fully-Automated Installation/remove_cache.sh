#!/bin/bash

echo "Removing Install Folder"
sleep .1
cd /VOlumes/PRESTADB/WFS/
rm -rf install
sleep .1
echo " >> Done << "

echo "Renaming Admin folder"
sleep 1
cd /Volumes/PRESTADB/WFS/
mv admin admin_no_name
sleep 1
echo " >>  Done << "

echo "To access your admin pane,"
sleep .1
echo "use your loopback or hostname IP address"
sleep .1
echo "with an ending /admin_no_name to access the site"
sleep .1
echo "Example: 127.0.0.1/admin_no_name"
clear

echo "Running cache removal instance..."
cd ~/
rm EP_Shop.sh
rm prestashop.yml
rm PS_Start.sh
echo ">> Done <<"
