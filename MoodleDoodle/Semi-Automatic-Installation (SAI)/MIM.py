import os
import logging
import apt

menu_options = {
    '1': 'Update and/or Upgrade OS (packages)',
    '2': 'Install Main Modules',
    '3': 'Site Configurator v1.0',
    '4': 'DB Configurator + Site Preparator 2',
    '5': 'VirtualHosts Repairs',
    '6': 'Remove Moodle',
    '0': 'Exit',
}
#  CheckOS Files
'''
               "docker exec -it mysql_moodle /bin/bash",
               "echo 'Insert following lines when inside MoodleMysql Container starting with command |echo| : '"
               "echo 'default_storage_engine = innodb' >> /etc/mysql/mysql.conf.d",
               "echo 'innodb_file_per_table = 1' >> /etc/mysql/mysql.conf.d",
               "echo 'innodb_file_format = Barracuda' >> /etc/mysql/mysql.conf.d",
               "exit",

def check_dependencies(run):
    cache = apt.Cache

    for run in cache:
        if git.is_installed:
            print(run)
        if apache2.is_installed:
            print(run)
'''
# OS_SCE = Single Command Execution


def OS_SCE(p_command):
    err = os.system(p_command)
    if err != 0:
        return err
    return None
# OS_MCE = Multiple Command Execution


def OS_MCE(p_commands_list):
    for _command in p_commands_list:
        err = os.system(_command)
        if err != 0:
            print("Some Weird Error Slutboi SugmaDig\n")
            return err

    return None
# OS Update and Upgrade Call


def OS_Update(p_unity):
    __update = "apt update -y"
    __upgrade = "apt upgrade -y"
    __all = ["apt update -y",
             "apt upgrade -y", ]

    if(p_unity == "UP"):
        OS_SCE(__update)
    elif(p_unity == "UPG"):
        OS_SCE(__upgrade)
    elif(p_unity == "ALL"):
        OS_MCE(__all)
    else:
        print("Action Aborted")
        os.system("clear")
    return OS_SCE
# Site Configuration Tool = SCT


def SiteConfigurator():

    __moovable_sed = ["echo 'Preparing Environment...'",
                      "sleep 5",                     
                      "echo 'Generating Git Branch...'",
                      "sleep 3",
                      "git branch --track remotes/origin/MOODLE_39_STABLE",
                      "git checkout remotes/origin/MOODLE_39_STABLE",
                      "git clone -b MOODLE_39_STABLE git://git.moodle.org/moodle.git",
                      "echo 'Moving Branch to the Webroot...'",
                      "sleep 2",
                      "mv -v moodle /var/www/html/",
                      "echo 'Writing permissions to |/var/www/html/moodle| recursively...'",
                      "sleep 2",
                      "chown -Rv www-data:www-data /var/www/html/moodle",
                      "sleep 3",
                      "clear",
                      "chmod -Rv 0755 /var/www/html/moodle",
                      "sleep 3",
                      "clear",
                      "echo 'Clean Up in Progress...'",
                      "sleep 4",
                      "echo 'Generating moodledata directory...'",
                      "sleep 3",
                      "mkdir -p /etc/moodledata",
                      "echo 'Writing permissions to |/etc/moodledata|...'",
                      "chown -Rv www-data /etc/moodledata",
                      "sleep 5",
                      "clear",
                      "chmod -Rv 0777 /etc/moodledata",
                      "sleep 1",
                      "clear",
                      "echo 'Site Structure configuration is complete!'",
                      "sleep 1",
                      "echo 'Please Configure your DB before exiting this Installation Script'",
                      "sleep 5",
                      ]
    OS_MCE(__moovable_sed)
# Docker Configuration Tool
def DCT():
    cache = apt.Cache()
    if 'docker-ce' in cache and cache['docker-ce'].is_installed:
        print("Docker and Docker-compose are installed on this system...")
        print("If you don't have MySQL Server installed on your system use Docker to prepare and configure the Server")
        __run_file = ["echo 'Preparing Environment...'",
                      "sleep 5",
                      "echo 'Fetching mysql configuration file...'",
                      "sleep 5",
                      "echo 'Executing |mysql.yaml|...'",
                      "docker-compose -f mysql.yaml up -d",
                      "docker restart mysql_moodle", ]
        OS_MCE(__run_file)
    else:
        print("Docker and Docker-compose are not installed on this system!")
        print("Preparing Environment for the Installation...\n")

        __install_docker = ["echo 'Adding Public key and setting docker repository...'",
                            "apt install apt-transport-https ca-certificates curl software-properties-common -y",
                            "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
                            "echo 'Adding Docker repository...'",
                            "sleep 4",
                            "add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable'",
                            "apt update",
                            "apt install docker-ce -y",
                            "echo 'Installing docker-compose...'",
                            "sleep 3",
                            "curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose",
                            "chmod +x /usr/local/bin/docker-compose",
                            ]
        OS_MCE(__install_docker)
# Value Management Tool = VMT
def VMT(_p_ruta_fichero, _text_match,_text_sustituto, _name_service):
    # opening the file in read mode
    file = open(_p_ruta_fichero, "r")
    replacement = ""
    # using the for loop
    for line in file:
        line = line.strip()
        changes = line.replace(_text_match, _text_sustituto)
        replacement = replacement + changes + "\n"
    file.close()
    # opening the file in write mode
    fout = open(_p_ruta_fichero, "w")
    fout.write(replacement)
    fout.close()

    _restart_service = "service [0] restart".format(_name_service)
    OS_SCE(_restart_service)

# Site Optimisation Tool
def SOT(apache, php):
    if(apache == "Y" or apache == "YES"):
       FILE_ROUTE= "/etc/apache2/sites-available/000-default.conf"
       TXT_MATCH= "DocumentRoot /var/www/html"
       TXT_REPLACE= "DocumentRoot /var/www/html/moodle"
       NAME_SERVICE_DEB="apache2"
       
       VMT(FILE_ROUTE,TXT_MATCH, TXT_REPLACE, NAME_SERVICE_DEB)
    elif(php == "Y" and php == "YES"):
        FILE_ROUTE= "/etc/php/7.4/apache2/php.ini"
        TXT_MATCH= ";max_input_vars = 1000"
        TXT_REPLACE= "max_input_vars = 5000"
        NAME_SERVICE_DEB="phpsessionclean"
   
        VMT(FILE_ROUTE,TXT_MATCH, TXT_REPLACE, NAME_SERVICE_DEB)
    else:   
       print("Operating Has been Canceled by User...")
       os.system("clear")
    
# WARNING: REMOVAL METHOD WILL REMOVE EVERYTHING RELATED TO MOODLE

def remover():
    print("WARNING: This option will remove everything related to moodle and may reset any configured services on your system\n")
    answ = input(
        "Are you sure to fully uninstall Moodle and its related packages? (Y/N): ").upper()
    if answ == "Y" or answ == "YES":

        print("Removing Apache2, PHP and Docker...\n")
        _sw_removal = ["rm -rf /var/www/",
                       "rm -rf /etc/moodledata",
                       "apt purge apache2 php-common php graphviz aspell php-pspell php-curl php-gd php-intl php-mysql php-xml php-ldap php-mbstring php-zip php-xmlrpc php-soap -y",
                       "apt autoremove -y",
                       "apt purge docker-ce docker-ce-cli docker-ce-rootless-extras docker-scan-plugin -y", ]
        OS_MCE(_sw_removal)
    else:
        print("Action Aborted...\n")
        os.system("clear")

def MainModules(p_choice, p_extras):

    if (p_choice == "C" and p_extras == "Y"):
        print("Running Complete Installation Sequence")
        __complete_installation = ["apt install apache2 -y",
                                   "apt install php-common -y",
                                   "apt install mysql-client -y",
                                   "apt install mysql-server -y",
                                   "apt install php -y",
                                   "apt install graphviz aspell php-pspell php-curl php-gd php-intl php-mysql php-xml php-ldap php-mbstring php-zip php-xmlrpc php-soap -y", ]
        OS_MCE(__complete_installation)
    elif (p_choice == "PW" and p_extras == "Y"):
        print("Running Partial Installation (Web-only) Sequence")
        __partial_installation_web = ["apt install apache2 -y",
                                      "apt install php-common -y",
                                      "apt install php -y",
                                      "apt install graphviz aspell php-pspell php-curl php-gd php-intl php-mysql php-xml php-ldap php-mbstring php-zip php-xmlrpc php-soap -y", ]
        OS_MCE(__partial_installation_web)
    elif (p_choice == "PDB" and p_extras == "N"):
        print("Running Partial Installation (DB-only) Sequence")
        __partial_installation_db = ["apt install mysql-client -y",
                                     "apt install mysql-server -y", ]
        OS_MCE(__partial_installation_db)
    else:
        os.system("clear")
        print("Action Aborted...")


def Menu():
    if __name__ == '__main__':
        while(True):
            print_menu()

            option = ''
            try:
                option = str(input('Enter your choice: '))
            except:
                print('Wrong input. Please enter a number ...')
            # Check what choice was entered and act accordingly
            if option == '1':
                unity = input(
                    ("Type | UP | to update, | UPG | to upgrade, | ALL | to update and upgrade the OS or | X | to Abort this Action: ")).upper()
                OS_Update(unity)
            elif option == '2':
                print("To run semi-automatic installation script type \n")
                choice = input(
                    ("| C | for Complete, | PW | for Partial Web, | PDB | for Partial DB Installation or | X | to Abort the Installation: ")).upper()
                modules = input(
                    ("Type Y or N to install extra PHP modules for you Moodle: ")).upper()
                MainModules(choice, modules)
            elif option == '3':
                SiteConfigurator()
            elif option == '4':
                DCT()
            elif option == '5':
                print("Optimising Moodle for Smoother Work... \n")
                apache = input(
                    "Do you want to access moodle directly?: ").upper()
                print(
                    "Newer version of Moodle require modified values for your PHP configuration file,")
                php = input(
                    "Would you like to change these values from 1000 to 5000: ").upper()
                SOT(apache, php)
            elif option == '6':
                remover()
            elif option == '0':
                exit()
            else:
                print('Invalid option. Please enter a number between 0 and 6.')


def print_menu():
    print("===================================================")
    print("++                                               ++")
    print("++                                               ++")
    print("++    Welcome to Main Installation Manager       ++")
    print("++                                               ++")
    print("++                V. 1.0.1                       ++")
    print("++                                               ++")
    print("===================================================")
    for key in menu_options.keys():
        print(key, '--', menu_options[key])
# SoftWare Integrity Tool


def NSWIT(result):
    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
    print("Checking network connection... ")
    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n")
    response = os.system("ping -c 4 " + "google.com")

    if response == 0:
        result = True
        Menu()
    else:
        result = False
        print("Error, you have no internet connection, please check your DNS server or IP configuration and run this installer again")
    return result


NSWIT(True)

'''
logging.basicConfig(filename='io.log', encoding='utf-8', level=logging.DEBUG)
logging.debug('lnchid=0')

print("\n")
'''
'''

boot= "lnchid=0"
log = open("io.log","r")

flag = 0 
index = 0
# Loop through the file line by line
for line in log:  
    index += 1 
      
    # checking string is present in line or not
    if boot in line:
        
      flag = 1
      break 
          
# checking condition for string found or not
if flag == 0: 
   print("You're running this app the first time, creating general purpose logfile and configurator") 
else: 
   print('String', boot , 'Found In Line', index)
  
# closing text file    
log.close() 

logging.debug('This message should go to the log file')
logging.info('So should this')
logging.warning('And this, too')
logging.error('And non-ASCII stuff, too, like Øresund and Malmö')

'''
