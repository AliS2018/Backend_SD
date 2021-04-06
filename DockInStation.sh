#Welcome to Media Archive Mass Installer For Students!
#This script will allow students to download and install necessary tools
#for System Administration, otherwise minimising the estimated time consumption on
#each of the installable package.

#DISCLAIMER: This is an open source script dedicated for use by the students of any
#institution. They have my explicit permission to modify, add or even rewrite the
#whole script for their monetary or non-monetary purposes.

/bin/bash


if ping -q -c 5 -W 5 google.com >/dev/null; then
    echo "You have a Stable Internet Connection, The Installer may Proceed..."
else
    echo "You don't have a Stable Internet Connection, Please Fix any
            Inconsistencies regarding this Problem and Relaunch this Script
            Again. Thanks!"
    clear
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
        echo "Downloading an additional script..."
        sleep 3
        git clone https://github.com/AliS2018/Script_Installer.git
        mkdir /tmp/temp_data01/
        mv ~/Script_Installer/* /temp_data01/
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
        echo "This script has found some errors, correct them and run this script again"
        exit 1
    fi
fi

HEIGHT=20
WIDTH=80
CHOICE_HEIGHT=5
BACKTITLE="Student Installer Script (EDITABLE)"
TITLE="Install Useful Software and Packages on Your Linux Operating System"
MENU="Choose one of the following options:"
OPTIONS=(1 "Install Apache2 <|INSTALL|>"
        2 "Install Docker and Docker Compose"
        3 "Install Oracle SQL Server (DOCKER)"
        4 "Exit and Remove Cache"
        5 "Exit")

CHOICE=$(dialog --clear \
  --backtitle "$BACKTITLE" \
  --title "$TITLE" \
  --menu "$MENU" \
     $HEIGHT $WIDTH $CHOICE_HEIGHT \
     "${OPTIONS[@]}" \
    2>&1 >/dev/tty)

   clear
       # Choices from N1 and N2 are just basic commands that come from Ubuntu's Repository,
       # which is why we only need to make sure the packages are installed on the system or not.
       # However when a person needs a software that was not initially added in a system's repo
       # we use a script that add everything automatically
    2)


       echo "Installing Docker and Docker Compose"
       sleep 2
       echo "MAKE SURE YOU RUN THIS SCRIPT AS ROOT!"
       sleep 2

       apt install apt-transport-https ca-certificates curl software-properties-common -y
       curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

       if (cat /etc/os-release | grep focal); then
         add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
       elif (cat /etc/os-release | grep bionic); then
         add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
       elif (cat /etc/os-release | grep xenial); then
         add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
       else
         echo "This system is unsupported, please contact the software manufacturer for any update!"
         exit 0
       fi
       apt update
       apt install docker-ce -y
       ##Install docker-compose

       curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
       chmod +x /usr/local/bin/docker-compose

       sleep 3

            echo "================DONE====================="
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

        ./DockInStation.
