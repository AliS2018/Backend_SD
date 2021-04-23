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
echo "=========Welcome to the (Docker Based) Oracle SQL Installer Script============="
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
echo ".............................DOCKER HAS BEEN INITIALISED......................."
sleep .1
echo "      *..         "
sleep .1
echo "      .*.         "
sleep .1
echo "      ..*         "
sleep .1
echo "      *..         "
sleep .1
echo "      .*.         "
sleep .1
echo "      ..*         "
sleep .1
echo "************************DOCKER IS ABOUT TO PULL SQL DATA FROM ITS SERVERS*************************************"
docker run -d --name temp_sql_orcl_serv wnameless/oracle-xe-11g-r2
echo "********************                  PULL COMPLETE                        ***********************************"
sleep 5
echo ""
echo "********************              CREATING DIRECTORIES...                  ***********************************"
sleep .1
mkdir -p /volumes/oracle/DB
sleep .1
echo "********************                     ==DONE==                          ***********************************"
echo ""
sleep 2
echo "********************              SETTING UP A CONTAINER...                ***********************************"
docker cp temp_sql_orcl_serv:/u01/app/oracle/. /volumes/oracle/DB/
echo "********************                   ===DONE===                          ***********************************"
echo ""
sleep .1
echo "********************              CLEANING UP TEMP DATA...                 ***********************************"
sleep .1
docker rm --force temp_sql_orcl_serv
echo "********************                  ====DONE====                         ***********************************"
echo ""
sleep 3
echo "********************              VERIFYING THE SCRIPT...                  ***********************************"
ls -la /volumes/oracle/DB/
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
echo "....."
cd ~/temp_data01/Massive-Installer-Script/Docker_Dashboard/
docker-compose -f universalhost.yml up -d
sleep .5
docker logs oracle_sqlserver
sleep 5
docker exec oracle_sqlserver /bin/bash -c "ls -la /u01/app/oracle"
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
docker ps -a | grep oracle_sqlserver
echo "This is the container name you will be using on your SQL Developer"
sleep 2
echo "Loading the Server Main IP address..."
hostname -I | cut -f1 -d' '
sleep .5
echo "Loading Users..."
sleep .5
echo "=================================="
sleep .2
echo "=========    User: SYS    ========"
sleep .3
echo "========  Password: oracle ======="
sleep .1
echo "=================================="
sleep .2
echo "              DONE                "
echo ""
sleep 10
echo "==============================================================================="
sleep .2
echo "=====       THE INSTALLATION HAS BEEN SUCCESSFULLY COMPLETED            ======="
sleep .2
echo "=====                                                                   ======="
sleep .2
echo "=========   Thank You for using Oracle SQL Installer Script             ======="
sleep .2
echo "=====                                                                   ======="
sleep .2
echo "======                Copyright 2020 A.Sadykov                          ======="
sleep .2
echo "==============================================================================="

cd /tmp/temp_data01/
./DockInStation
echo "Thanks for using this script, loading the home page..."
sleep 5
clear
