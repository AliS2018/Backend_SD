#Welcome to Media Archive Mass Installer For Students!
#This script will allow students to download and install necessary tools
#for System Administration, otherwise minimising the estimated time consumption on
#each of the installable package.

#DISCLAIMER: This is an open source script dedicated for use by the students of any
#institution. They have my explicit permission to modify, add or even rewrite the
#whole script for their monetary or non-monetary purposes.

#!/usr/bin/env bash


if ping -q -c 5 -W 5 google.com >/dev/null; then
    echo "You have a Stable Internet Connection, The Installer may Proceed..."
else
    clear
    echo "You don't have a Stable Internet Connection, Please Fix any
            Inconsistencies regarding this Problem and Relaunch this Script
            Again. Thanks!"
   
    echo "Exit, Error 1"
   exit 1
fi

# a few packages are needed to run this software, this script Automatically
# verifies whether the server has these packages installed and if not
# it installs them automatically

#Package 1 (dialog)
if dpkg --get-selections | grep 'dialog' |
    grep 'Displays user-friendly dialog boxes from shell scripts'; then
    echo "The Massive Installer will launch shortly..."
    sleep 3
    if dpkg -l | grep 'git' |
        grep 'fast, scalable, distributed revision control system'; then
        echo "GIT is Active, Launching the Software. . ."
sleep 4

        echo "Scripts have been exported!"
      else
          echo "GIT is not Installed!"
          sleep 2
          echo "Installing GIT Automatically. . ."
          sleep 3
          apt-get install --yes git
          echo "GIT has been Successfully Installed, Continuing . . . "
    fi
else
    echo "Installing the Package..."
    sleep 2
    apt-get install --yes dialog
    sleep 2
    echo "DONE"
    echo ""
    echo ""
    echo "Verifying the package"

    if dpkg -l | grep dialog; then
        sleep 2
        echo "Software is on the system! Verification is completed."
    else
        echo "This script has encountered some errors, correct them and run this script again"
        exit 1
    fi

fi

echo ""
sleep 2
echo "Removing Overlapping Script..."
	if [ -f "~/Script_Installer/DockInStation.sh" ];
then
rm -rf ~/Script_Installer/DockInStation.sh
else
echo "OK"
fi
echo " "
sleep 1


echo "Downloading Additional Scripts..."
if [ -d "/tmp/temp_data01" ];
then
    echo "Directory Exists..."
    sleep .3
    echo "Cleaning Up..."
  rm -rf /tmp/temp_data01
    echo "Rebuilding datastructure. . ."
    sleep 3
  git clone https://github.com/AliS2018/Script_Installer.git
    sleep 5
  mkdir /tmp/temp_data01/
    sleep 1
  mv ~/Script_Installer/* /tmp/temp_data01/
  sleep 1
  echo "Updating the Main Script. . ."
  mv ~/Script_Installer/DockInStation.sh ~/
  chmod +x DockInStation.sh
  sleep 2
  echo "Removing Useless Directory..."
  rm -rf ~/Script_Installer
  echo "Reloading the Script..."
  cd ~/
  ./DockInStation.sh
    echo ""
  elif [ ! -d "/tmp/temp_data01" ];
  then 
    echo "No datastructure found..."
    sleep 1
    echo "Generating new datastructure..."
    touch DIS.log 
    echo "temporary files:" >> DIS.log
    echo "1. I_S" >> DIS.log
    echo "1.1. I_S/MSSQL_Server.sh" >> DIS.log
    echo "1.2. I_S/Oracle_SQL.sh" >> DIS.log
    echo "1.3. I_S/Docker-Installer.sh" >> DIS.log
    echo "1.4. I_S/Microsoft_SQLServer_EZ.sh" >> DIS.log
    echo "1.4.1. I_S/Profiles/universalhost.yml" >> DIS.log
    echo "1.4.2. I_S/Profiles/sql_server.yml" >> DIS.log
    echo "1.5. I_S/MSSQL_Server_EZ.sh" >> DIS.log
    echo "1.6. I_S/Postgresql.sh" >> DIS.log
    echo "2. README" >> DIS.log
    echo "3. DockInStation.sh" >> DIS.log
    echo "COMMIT;" >> DIS.log
    sleep 2
    echo "Creating folders. . . "
    mkdir /tmp/temp_data01
    git clone https://github.com/AliS2018/Script_Installer.git
    mv ~/Script_Installer/* /tmp/temp_data01/
    rm -rf ~/Script_Installer
    chmod -R +x /tmp/temp_data01/I_S/*
    echo "DONE"
    sleep 2
    echo " "
else 
    sleep 1
    echo "Unknown Error, wrapping up..."
    sleep 5
  rm -rf /tmp/temp_data01
  rm -rf ~/Script_Installer
fi

HEIGHT=20
WIDTH=80
CHOICE_HEIGHT=5
BACKTITLE="Student Installer Script (EDITABLE)"
TITLE="Install Useful Software and Packages on Your Linux Operating System"

MENU="Choose one of the following options:"

OPTIONS=(1 "Install Apache2 <|INSTALL|>"
        2 "Install Docker and Docker Compose <|INSTALL|>"
        3 "Install Oracle SQL Server (DOCKER)  <|INSTALL|>"
        4 "Install Microsoft SQL Server (DOCKER) <|!ISSUES!|>"
        5 "Install Microsoft SQL Server (Easy Installation Docker) <|INSTALL|>"
        6 "Install PostgreSQL Server <|INSTALL|>"
        7 "Remove Cache"
        8 "Exit")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

   case $CHOICE in
       # Choices from N1 and N2 are just basic commands that come from Ubuntu's Repository,
       # which is why we only need to make sure the packages are installed on the system or not.
       # However when a person needs a software that was not initially added in a system's repo
       # we use a script that add everything automatically

     1)
           if dpkg -l | grep 'apache2'; then
               echo "Your System has Apache2 Installed and Updated! Skipping > > > > "
               sleep 3
           else
               sleep 1
               echo "Apache2 was Not Found on Your System! Continuing > > > > "
               sleep 1
               echo "The System is About to Install Apache2..."
               sleep 2
               apt-get install apache2 --yes
               echo "================DONE====================="
           fi
           ;;

      2)
              echo "Installing Docker and Docker Compose"
              sleep 2
              echo "MAKE SURE YOU RUN THIS SCRIPT AS ROOT!"
              sleep 2

              apt install apt-transport-https ca-certificates curl software-properties-common -y
              curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

              if (cat /etc/os-release | grep focal)
                then  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
                echo "Your system is Ubuntu Server 20.04 Focal Fossa, this is a logging system" >> DIS.log
              elif (cat /etc/os-release | grep bionic) 
                then  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
                echo "Your system is Ubuntu Server 18.04 Bionic Beaver, this is a logging system" >> DIS.log
              elif (cat /etc/os-release | grep xenial)
                then  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
                echo "Your system is Ubuntu Server 16.04 Xenial, this is a logging system" >> DIS.log
              else
                echo "[ERROR 10] - This system is currently unsupported, please contact software manufacturer for any update!" >> DIS.log
                exit 0
              fi
              apt update
              apt install docker-ce -y
              ##Install docker-compose

              curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
              chmod +x /usr/local/bin/docker-compose

              sleep 3
                   echo "================DONE====================="
           ;;
      3)
              sleep 3
            echo "Running the Oracle SQL Server Script. . ."
           cd /tmp/temp_data01/I_S/
           chmod +x Oracle_SQL.sh
           ./Oracle_SQL.sh
           ;;
      4) sleep 2
        echo "Running the MSSQL Server Script. . ."
        sleep 1
        cd /tmp/temp_data01/I_S/
        chmod +x MSSQL_Server.sh
        ./MSSQL_Server.sh
      ;;
      5)
      echo "Running the EZ MSSQL Server Script. . ."
             sleep 1
             cd /tmp/temp_data01/I_S/
             chmod +x MSSQL_Server_EZ.sh
             ./MSSQL_Server_EZ.sh
           ;;
      6)
      echo "Running Postgres Installer Script. . ."
        sleep 1
        cd /tmp/temp_data01/I_S/
        chmod +x Postgresql.sh
        ./Postgresql.sh
      ;;
      7)
      echo "REMOVING TEMPORARY DATA. . ."
      sleep 3
      rm -rf /tmp/temp_data01
      exit 0
      ;;
      
      8) echo "Exitting the Software. . ."
      sleep 2
      clear
      exit 0
      
esac

