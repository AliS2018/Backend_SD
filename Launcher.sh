#!/usr/bin/env bash
#  MassInstallerScript.sh
#  Script version 1.1b
#
#  Created by Ali Sadykov on 01/04/2020.
#
# This is a Debian Installer Script for Products based on Ubuntu 18.04.xx. Script main version 2.3.1030 ©Ali Sadykov
# This script is not supported by ARM64 architecture (Raspberry Pi, etc...), thus preventing the correct Docker and other software functionality.
# If you wish to improve the script by adding logical parts and statements, please send your copy to the following email --> maintenanceos.mos@gmail.com Thank You!
# This software is absolutely free for personal use and any personal modification.
# Current Script version 2.3.96B Improvements Pending <-no commercial use->
# RUN THIS SCRIPT AS ROOT!
#variables:
DIR0="$( cd "$( dirname "${/MIS.sh}" )" >/dev/null 2>&1 && pwd )"
DIR1="/temp_data01/Massive-Installer-Script/DockerManager/"

clear

echo "@@@@@@@@@@@@ CHECKING YOUR INTERNET CONNECTION @@@@@@@@@@@@@@"
#Checking internet connection by resolving names
#If Ping doesn't work correctly this program/script will show an error and exit uppon that mentioned error.

if ping -q -c 5 -W 5 google.com >/dev/null; then
    echo "You have a Stable Internet Connection, The Installer may Proceed..."
else
    echo "You don't have a Stable Internet Connection, Please Fix any Inconsistencies regarding this Problem and Relaunch this Script Again. Thanks!"
    exit 1
fi

# In order for this script to work another package is needed that generates a beautiful choice screen
# If a server doesn't have it installed, Script will automatically install it

if dpkg -l | grep '^ii'| grep 'dialog'|  grep '1.3-20171209-1'; then
    echo "The Mass Installer - Docker Launcher Panel will launch shortly..."
    sleep 3
else
    echo "No Package is Found on This Server! "
    echo "Installing the Package..."
    sleep 2
    for x in {1..100} ; do
        sleep .1    # do some work here
        apt-get install --yes dialog
        printf .
    done | pv -pt -i0.2 -s100 -w 80 > /dev/null
    dpkg -l | grep dialog
    echo "OK"
fi
if dpkg -l |grep 'git' | grep 'fast, scalable, distributed revision control system'; then
    echo "GIT is Active, Launching the Software. . ."
else
    echo "GIT is Not Installed!"
    sleep 2
    echo "Installing GIT Automatically. . ."
    sleep 3
    for x in {1..100} ; do
        sleep .1    # do some work here
        apt-get install --yes git
        apt-get install --yes git-man
        printf .
    done | pv -pt -i0.2 -s100 -w 80 > /dev/null
    echo "GIT has been Successfully Installed, Continuing . . . "
fi

if [ -d ~/temp_data01/Massive-Installer-Script/DockerManager/ ]
    then
        echo "Directory: $DIR1 Already Exists . . . "
        sleep 1
        echo "No Updates were Found!"
    else
        echo "Generating Temporary Directory . . . "
        mkdir -p ~/temp_data01
        cd ~/temp_data01/
        echo "Loading Libraries..."
        git clone https://github.com/AliS2018/Massive-Installer-Script.git
        cd ~/temp_data01/Massive-Installer-Script/DockerManager
        chmod +x Docker-Installer.sh
        chmod +x OracleSQLv1.4.sh
        chmod +x EngineX.sh
        chmod +x gitlab.sh
        chmod +x portainer-enabler.sh
        chmod +x WordPress.sh
    echo "DONE..."
fi
echo "Loading Tools..."
sleep 5

echo "NOTE: If you don't have Docker installed and configured, this script will automatically fail ! ! ! "
sleep 5
HEIGHT=20
WIDTH=80
CHOICE_HEIGHT=5
BACKTITLE="Welcome to The Massive Installer Script - Docker Launcher"
TITLE="Install Useful Software and Packages on Your Linux Operating System"

MENU="Choose one of the following options:"

OPTIONS=(1 "Install Docker and Docker-Compose"
         2 "Install OracleSQL"
         3 "Install NGINX <unavailable>"
         4 "Install GitLab <unavailable>"
         5 "Install Portainer <unavailable>"
         6 "Install WordPress"
         7 "More... <unavailable>"
         8 "<|  Return  |>"
         9 "Remove Docker Cache"
         10 "Check Data? <DUH?!?!?!>")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)
clear
case $CHOICE in
# Choices from N1 and N2 are just basic commands that come from Ubuntu's Repository,
# which is why we only need to make sure the packages are installed on the system or not.
# However when a person needs a software that was not initially added in a system's repo we use a script that add everything automatically
       1)
           echo "Docker Installation is in Progress..."
                sleep 4
            if apt list --installed | grep docker-ce-cli && dpkg -l | grep docker; then
                echo "Your System has Docker/Docker-Compose Client Installed and Updated! Launching the Manager > > > > "
                sleep 3
                cd ~/Massive-Installer-Script/DockerManager/
                ./Launcher
            else
                sleep 1
                echo "Docker and Docker Compose was Not Found on Your System! Continuing > > > > "
                sleep 3
                cd ~/temp_data01/Massive-Installer-Script/
                ./DockerInstall.sh
                echo "================DONE====================="
            fi
            ;;
       2)
           echo "Installing OracleSQL is in Progress..."
                sleep 4
            if dpkg -l | grep docker; then
                    echo "Your system has Docker/Docker-Compose client installed and updated! Continuing > > > > "
                    sleep 2
                    cd ~/temp_data01/Massive-Installer-Script/DockerManager
                    ./OracleSQLv1.3.2.sh
            else
                    sleep 1
                    echo "No Docker was found on your system! <!> <!> <!> <!> "
                    sleep 3
                    echo "Please Install Docker first and only then start this installer!"
                    sleep 5
                   cd ~/Mass-Installer-Script/DockerManager/
                    ./Launcher
                echo "================DONE====================="
            fi
            ;;
       3)
    
                  ;;
       4)
    
                  ;;
       5)
           
                  ;;
       6)
            echo "Installing WordPress is in Progress..."
                    sleep 4
                if dpkg -l | grep docker; then
                    echo "Your system has Docker/Docker-Compose client installed and updated! Continuing > > > > "
                    sleep 2
                    cd ~/temp_data01/Massive-Installer-Script/DockerManager
                    ./WordPress.sh
                else
                    sleep 1
                    echo "No Docker was found on your system! <!> <!> <!> <!> "
                    sleep 3
                    echo "Please Install Docker first and only then start this installer!"
                    sleep 5
                    cd ~/Mass-Installer-Script/DockerManager/
                    ./Launcher
                    echo "================DONE====================="
                fi
                  ;;
       7)
                  ;;
       8)
           echo "Returning Back to the Main Menu..."
                    sleep 4
                    cd ~/
                    ./Mass-Installer.sh
                  ;;
       9)
           echo "Exit Sequence has been Initiated..."
                echo "Restarting Plex Media Server..."
                sleep 1
                  service plexmediaserver restart
                echo "Restarting Webmin Server..."
                sleep 1
                  service webmin restart
                echo "Restarting VirtualBox Drivers..."
                sleep 1
                  service vboxdrv restart
                echo "Restarting Docker..."
                sleep 1
                  service docker restart
                echo "Restarting Cockpit Dashboard..."
                sleep 1
                  service cockpit restart
            echo " ===== THANKS FOR USING MASS INSTALLER SCRIPT ====="
                  exit 0
                  
            ;;
     10)
           echo "Cleaning up..."
                  sleep 2
                  cd /
                  echo "Flushing Services and Cache..."
                  sleep 2
                  sudo docker system prune -a
                  sleep 2
                  echo "Cache Cleanup Completed !!!"
                  exit 0
                  ;;
esac
##DOCKER CHECK CONSISTENCY
