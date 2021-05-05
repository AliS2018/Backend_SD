#!/bin/bash
#This is a Debian Installer Script for Products based on Ubuntu 18.04 version 1.4.1B©Ali Sadykov
#This script is not supported by ARM64 architecture (Raspberry Pi, etc...), thus preventing the correct Docker functionality.
#If you wish to improve the script by adding logical parts and statements, please send your copy to the following email --> maintenanceos.mos@gmail.com Thank You!
#Current Script version 1.4.12B Improvements Pending <-no commercial use->
# RUN THIS SCRIPT AS ROOT!

echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
sleep .1
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
sleep .1
echo "||||||||||||||              RUNNING SOME ERRANDS                  |||||||||||||"
sleep 1
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
sleep 1
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
sleep .1
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
sleep .1
echo "==============================================================================="
sleep .2
echo "=====                                                                   ======="
sleep .2
echo "=====                                                                   ======="
sleep .2
echo "=========Welcome to the (Docker Based) Microsoft SQL Installer    ============="
sleep .2
echo "=====                                                                   ======="
sleep .2
echo "======                                                                  ======="
sleep .2
echo "==============================================================================="
sleep .5
echo ""
sleep .5
echo ""
sleep .5
echo ""
sleep .5
echo ""
sleep .5
echo ""
sleep .5
echo "@@@@@@@@@@@@@@@@@@@@ CHECKING YOUR INTERNET CONNECTION @@@@@@@@@@@@@@@@@@@@@@@@"
if ping -q -c 5 -W 5 google.com >/dev/null; then
  echo "You have a Stable internet connection, you may proceed with the installer..."
else
  echo "You don't have a Stable Internet connection, please fix any errors/issues regarding this problem and relaunch this Script again. Thanks!"
  exit 1
fi
echo ""
sleep .1
echo ""
sleep .1
echo "Installer Starts in 3..."
sleep .2
echo "                      2..."
sleep .2
echo "                        1..."
sleep 10
echo ".............................DOCKER HAS BEEN INITIATED......................."
sleep .1
echo "************************DOCKER IS ABOUT TO PULL SQL DATA FROM ITS SERVERS*************************************"
docker run -d --name temp_sql_srv  mcr.microsoft.com/mssql/server
echo "********************                  PULL COMPLETE                        ***********************************"
sleep 5
echo ""
echo "********************              CREATING DIRECTORIES...                  ***********************************"
sleep .1
mkdir -p /volumes/microsoft/DB
sleep .1
echo "********************                     ==DONE==                          ***********************************"
echo ""
sleep 2
echo "********************              SETTING UP A CONTAINER...                ***********************************"
docker cp temp_sql_srv:/var/opt/mssql/. /volumes/microsoft/DB/
echo "********************                   ===DONE===                          ***********************************"
echo ""
sleep .1
echo "********************              CLEANING UP TEMP DATA...                 ***********************************"
sleep .1

docker rm --force temp_sql_srv
echo "********************                  ====DONE====                         ***********************************"
echo ""
sleep 3
echo "********************              VERIFYING THE SCRIPT...                  ***********************************"
ls -la /volumes/microsoft/DB/
sleep .5
    echo "The installation may proceed"
sleep .5
echo "********************                  ====DONE====                         ***********************************"
sleep 3
echo "********************              CONFIGURING SQL SERVER...                ***********************************"
sleep .1
echo "please wait."
sleep .1
echo ".."
sleep .1
echo "..."
sleep .1
echo "...."
sleep .1
cd /tmp/temp_data01/Profiles
docker-compose -f /tmp/temp_data01/Profiles/sql_server.yml up -d
sleep .5
docker logs microsoft_sqlserver
sleep 5
docker exec  microsoft_sqlserver /bin/bash -c "ls -la /var/opt/mssql/"
echo "********************                  ====DONE====                         ***********************************"
sleep .5
echo ""
sleep .5

echo "********************                  GLOBAL CLEANUP...                     ***********************************"
echo ""
sleep .5
cd /
docker system prune -a
echo "********************                  ====DONE====                         ***********************************"
sleep .5
echo ""
sleep .5
echo "                                  CONFIGURATION DATA SUMMARY                                                  "
echo ""
echo "Loading Containers..."
sleep 2
docker ps -a | grep microsoft_sqlserver

echo "Loading the Server Main IP address..."
hostname -I | cut -f1 -d' '
sleep .5
echo "To access the database please use the shown IP address and an available port on :1433"
echo "Loading Users..."
sleep .5
echo "=================================="
sleep .2
echo "=========    User: SA    ========"
sleep .3
echo "========  Password: 12345 ======="
sleep .1
echo "=================================="
sleep .2
echo "====== WARNING! CHANGE THE SA user's PASSWORD TO PREVENT ANY FURTHER ISSUES ======"
sleep 10
echo "              DONE                "
echo ""
sleep 10
echo "==============================================================================="
sleep .2
echo "=====       THE INSTALLATION HAS BEEN SUCCESSFULLY COMPLETED            ======="
sleep .2
echo "=====                                                                   ======="
sleep .2
echo "=========   Thank You for using MSSQL Installer Script                  ======="
sleep .2
echo "=====                                                                   ======="
sleep .2
echo "======                Copyright 2020 A.Sadykov                          ======="
sleep .2
echo "==============================================================================="

cd ~/
./DockInStation.sh
echo "Thanks for using this script, loading the home page..."
sleep 5
clear
