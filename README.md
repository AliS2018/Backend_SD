# Backend Software Deployer or BSD 
*Original Name Script_Installer*

I think I'm overcomplicating the installation process but:
to run the script smoothly clone the repository to the ~/ path,
otherwise when it comes to running the same script again the system will show errors.

Move the Main DockInStation file to the ~/ folder of your current user;
Delete the Script_Installer folder (it will be eventually moved to /tmp directory)

chmod +x the script

RUN THE SCRIPT AS ROOT, either by running sudo or just using the root account

To execute the script just type ./DockInStation.sh or sudo ./DockInStation.sh

# Project_PS

----

As mentioned: PS stands for Prestashop

> Fully Automated Installation (FAI): Will create containers to hold all the necessary data for prestashop to work
----
> Manual Installation: Will create directories and folders and dbs directly on your HDD

----
# FAI Contents:
 > PS_Start.sh: Main script, starts all the installation process
 ----
 > EP_Shop.sh: installs docker-compose if doesn't exist and enable the following configuration file
-----
 > prestashop.yml: configuration file for your prestashop and mysql database (contains all the db and ps path)
----
 > remove_cache.sh: changes to admin folder and install folder after installation of prestashop
 ----
# MI Contents:
 > PrestaShop.sh: main script, it will install all the necessary dependencies, and prestashop main files.
 > mycompose-mySQL.yml: docker compose configuration file that will create a mysql database for your site
 > rm.sh: will remove php dependencies and modules if issues were to appear

-----
*Project_PS*
-----
database.yml working version of mysql database with it hyperlinks and stuff
nextcloud.yml unstable version of ncl with its database and stuff, yet unknown if works
owncloud.yml stable version of owncloud docker configuration file, will work after first run
