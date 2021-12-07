#!/bin/bash

echo "Removing Install Folder"
sleep .1
rm -rf /PRESTADB/WFS/install
sleep .1
echo " >> Done << "

echo "Renaming Admin folder"
sleep 1
mv /PRESTADB/WFS/admin /PRESTADB/WFS/admin_renamed_storage
sleep 1
echo " >>  Done << "

echo "To access your admin pane,"
echo "use your loopback or hostname IP address"
echo "with an ending /admin_renamed_storage to access the site"
echo "Example: 127.0.0.1/admin_renamed_storage"