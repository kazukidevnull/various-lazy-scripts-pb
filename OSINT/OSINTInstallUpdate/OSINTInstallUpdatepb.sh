#!/bin/bash
tput setaf 5;echo "#############################################################"
tput setaf 5;echo "# Kazuki OSINT Tools Installer and Updater                  #"
tput setaf 5;echo "# Attempting to install/update OSINT Tools on Debian system #"
tput setaf 5;echo "# Plan for this is to run on new debian deployment          #"
tput setaf 5;echo "# possible also for updating tools                          #"
tput setaf 5;echo "#############################################################"
tput setaf 5;echo "# COLOR CODES:     #"
tput setaf 2;echo "# SUCCESS:         #"
tput setaf 5;echo "# INFO:            #"
tput setaf 3;echo "# WARNING/CAUTION: #"
tput setaf 1;echo "# ERROR:           #"
#tput setaf 4;echo "# Blue:"
#tput setaf 6;echo "# Cyan:"
#tput setaf 7;echo "# Gray:"
tput setaf 5;echo "####################"

tput setaf 5;echo "By running this script you confirm that you know what you are doing and that you do not mind if your system may or may not get fucky wucky from running this script!



select yes to continue, select no to exit this script"
{
select yn in "Yes" "No"; do
    case $yn in
        Yes)break;;
        No) exit;;
    esac
done
}

#################

echo "[+] Update + Upgrade System.."
sudo apt update -qq 
sudo apt upgrade -qq -y
#sudo npm install npm@latest -g
#sudo npm update -g

echo "[+] Upgrading linux version to latest..."
sudo apt dist-upgrade -qq -y
sudo apt full-upgrade -qq -y

#################

tput setaf 5;echo "[+] Installing python3 and pip3 if not already installed..."
{
        sudo apt-get install python3 -y || tput setaf 1; read -p "PYTHON3/PIP3 INSTALL WENT FUCKY WUCKY, EXITING SCRIPT"; exit;;
} 
tput setaf 2;echo "[+] Done."

################

tput setaf 5;echo "[+] Reinstalling or Updating PIP..."

#This part is to fix certificate verfication error on older pip3 versions, this should not trigger unless the pip3 version is less then 20 

value=$(pip3 -V | grep -ic "20")

if [ $value -ge 1 ]
then
	break;;
else
{ cd /usr/share/
		curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py || tput setaf 3;echo "[!] ERROR DOWNLOADING get-pip.py, EXITING SCRIPTT"; exit;;
		python3 get-pip.py || tput setaf 3;echo "[!] ERROR INSTALLING get-pip.py, EXITING SCRIPTT"; exit;;
		rm get-pip.py || tput setaf 3;echo "[!] ERROR REMOVING get-pip.py, EXITING SCRIPTT"; exit;;
}fi
tput setaf 2;echo "[+] Done."


################
#NOT REALLY "ESSENTIAL",  MOSTLY  INSTALLED CAUSE MANY SCRIPTS NEED GIT  TO RUN BUT THAT'S STUPID,SO COMMENTED IT OUT FOR NOW AND IINSTEAD JUST TRY #MAKE THE NEEDED SCRIPT USE CURL/GET INSTEAD

#tput setaf 5;echo "[+] Installing GIT if not already installed..."
#{
#        sudo apt-get install git -y || tput setaf 1; read -p "GIT INSTALL WENT FUCKY WUCKY, EXITING SCRIPT"; exit;;
#} 
#tput setaf 2;echo "[+] Done."



#################

tput setaf 5;echo "[+] Installing anonsurf if not already installed..."
{
	if [ -d "/usr/share/kali-anonsurf " ]; then
	
		tput setaf 5;echo "kali-anonsurf  EXIST, SKIPPING"; break;;
	else
		mkdir /usr/share/kali-anonsurf 
			cd /usr/share/kali-anonsurf 
				sudo curl https://github.com/Und3rf10w/kali-anonsurf.git || tput setaf 3;echo "[!] DOWNLOADING FILES FAILED, SKIPPING!"; break;;
				chmod +x installer.sh || tput setaf 3;echo "[!] CAN NOT CHMOD, SKIPPING"; break;;
				./installer.sh || tput setaf 3;echo "[!] ERROR RUNNING INSTALLER, SKIPPING"
	fi
}
tput setaf 2;echo "[+] Done."
#considered making a option to run rest of install script trought anonsurf, but atm that can introduce too many unknown variables, so decided against it for now

#################
tput setaf 5;echo "[+] Installing or Updating LittleBrother..."
{
	if [ -d "/usr/share/LittleBrother" ]; then
	
		cd /usr/share/LittleBrother
        	sudo git pull https://github.com/Lulz3xploit/LittleBrother --rebase
	else
		sudo git clone https://github.com/Lulz3xploit/LittleBrother /usr/share/LittleBrother
	fi
}
tput setaf 2;echo "[+] Done."

#################


tput setaf 5;echo "[+] Installing or Updating youtube-dl..."
{
        sudo -H pip3 install --upgrade youtube-dl || sudo -H pip3 install youtube-dl -y
} 
tput setaf 2;echo "[+] Done."

#################

tput setaf 5;echo "[+] Installing or Updating Twint..."
{
        sudo -H pip3 install --upgrade twint || sudo -H pip3 install twint -y
} 
tput setaf 2;echo "[+] Done."

##################

tput setaf 5;echo "[+] Installing or Updating PhoneInfoga..."
{
        if [ -d "/usr/share/phoneinfoga" ]; then        
	
		cd /usr/share/phoneinfoga
		sudo git init
        	sudo git pull https://github.com/sundowndev/PhoneInfoga.git --rebase
	else
		sudo git clone https://github.com/sundowndev/PhoneInfoga.git /usr/share/phoneinfoga
	fi
tput setaf 2;echo "[+] Done."

###################

tput setaf 5;echo "[+] Installing or Updating theHarvester..."
{
	cd /usr/share/
		curl https://github.com/laramies/theHarvester || tput setaf 3;echo "[!] DOWNLOADING FILES FAILED, SKIPPING INSTALL!"; break;;
		cd /usr/share/theHarvester|| tput setaf 3;echo "[!] CAN NOT ENTER THEHARVESTER DIR, SKIPPING"; break;;
			python3 -m pip install -r requirements/base.txt || tput setaf 3;echo "[!] INSTALL REQ ERROR, SKIPPING INSTALL"; break;;
			python3 theHarvester.py -h || tput setaf 3;echo "[!] INSTALL ERROR, SKIPPING INSTALL"; break;;
} 
	tput setaf 2;echo "[+] Done."

####################

tput setaf 5;echo "[+] Installing or Updating ExifScan..."
{
        if [ -d "/usr/share/exifscan" ]; then        
	
		cd /usr/share/exifscan
        	sudo git pull https://github.com/rcook/exifscan.git --rebase
	else
		sudo git clone https://github.com/rcook/exifscan /usr/share/exifscan
	fi
}
tput setaf 2;echo "[+] Done."

#####################

tput setaf 5;echo "[+] Installing or Updating DumpsterDiver..."
{
        if [ -d "/usr/share/DumpsterDiver" ]; then        
	
		cd /usr/share/DumpsterDiver
		sudo git pull https://github.com/securing/DumpsterDiver.git --rebase
	else
		sudo git clone https://github.com/securing/DumpsterDiver /usr/share/DumpsterDiver
	fi
} 
tput setaf 2;echo "[+] Done."

######################

tput setaf 5;echo "[+] Installing or Updating Sherlock..."
{
        if [ -d "/usr/share/sherlock" ]; then        
	
		cd /usr/share/sherlock
		sudo git init
        	sudo git pull https://github.com/sherlock-project/sherlock.git --rebase
	else
		sudo git clone https://github.com/sherlock-project/sherlock /usr/share/sherlock
	fi
} 
tput setaf 2;echo "[+] Done."


##########################

tput setaf 5;echo "[+] Installing or Updating Infoga..."
{
        if [ -d "/usr/share/Infoga" ]; then        
	
		cd /usr/share/Infoga
        	sudo git pull https://github.com/m4ll0k/Infoga.git --rebase
	else
		sudo git clone https://github.com/m4ll0k/Infoga /usr/share/Infoga
	fi
} 
tput setaf 2;echo "[+] Done."

#########################

tput setaf 5;echo "[+] Installing or Updating Metagoofil..."
{

	if [ -d "/usr/share/metagoofil" ]; then        
	
		cd /usr/share/metagoofil
		sudo git init
        	sudo git pull https://github.com/opsdisk/metagoofil.git --rebase
	else
		sudo git clone https://github.com/opsdisk/metagoofil /usr/share/metagoofil
	fi
} 
tput setaf 2;echo "[+] Done."

##########################

tput setaf 5;echo "[+] Installing or Updating Stego Toolkit..."
{
        if [ -d "/usr/share/stego-toolkit" ]; then        
	
		cd /usr/share/stego-toolkit
        	sudo git pull https://github.com/DominicBreuker/stego-toolkit.git --rebase
	else
		sudo git clone https://github.com/DominicBreuker/stego-toolkit.git  /usr/share/stego-toolkit
	fi
} 
tput setaf 2;echo "[+] Done."


##########################

###github install path updated by kazuki###

tput setaf 5;echo "[+] Installing or Updating OSINT-Search..."
{
    cd /usr/share/
		sudo curl https://github.com/am0nt31r0/OSINT-Search.git || tput setaf 3;echo "[!] DOWNLOADING FILES FAILED, SKIPPING INSTALL!"; break;;
 			cd /usr/share/OSINT-Search || tput setaf 3;echo "[!] ERROR CHANGING DIR, SKIPPING INSTALL"; break;;
				python3 -m pip install -r requirements.txt || tput setaf 3;echo "[!] ERROR RUNNING INSTALLER, SKIPPING INSTALL"
}
##########################

tput setaf 5;echo "[+] Installing or Updating goggle-search-API..."
{
    cd /usr/share/Google-Search-API || mkdir /usr/share/Google-Search-API
		cd Google-Search-API || tput setaf 3;echo "[!] ERROR CHANGING DIR, SKIPPING INSTALL"; break;;
			sudo pip3 install git https://github.com/abenassi/Google-Search-API || tput setaf 3;echo "[!] pip3 GIT INSTALL FAILED, SKIPPING INSTALL!"
} 

##########################

tput setaf 5;echo "[+] Installing or Updating DNS-Dumpster..."
{
    cd /usr/share/Dnsdumpster || mkdir /usr/share/Dnsdumpster
		cd Dnsdumpster || tput setaf 3;echo "[!] ERROR CHANGING DIR, SKIPPING INSTALL"; break;;
			pip install https://github.com/PaulSec/API-dnsdumpster.com/archive/master.zip --user || tput setaf 3;echo "[!] pip3 GIT INSTALL FAILED, SKIPPING INSTALL!"
} 
	
tput setaf 2;echo "[+] Done."

###########################


tput setaf 5;echo "[+] Installing or Updating sn0int..."
{
        if [ -d "/usr/share/sn0int" ]; then        
	
		cd /usr/share/sn0int
        	sudo git pull https://github.com/kpcyrd/sn0int.git --rebase
        	sudo cargo install -f --path .
	else
		sudo git clone https://github.com/kpcyrd/sn0int /usr/share/sn0int
	fi
}  
tput setaf 2;echo "[+] Done."


############################

tput setaf 5;echo "[+] Installing or Updating Spiderpig..."
{
        if [ -d "/usr/share/Spiderpig" ]; then        
	
		cd /usr/share/Spiderpig
        	sudo git pull https://github.com/hatlord/Spiderpig.git --rebase
        	bundle install
	else
		sudo git clone https://github.com/hatlord/Spiderpig /usr/share/Spiderpig
	fi
}
tput setaf 2;echo "[+] Done."

######################

tput setaf 5;echo "[+] Installing or Updating WhatsMyName..."
{
        if [ -d "/usr/share/WhatsMyName" ]; then        
	
		cd /usr/share/WhatsMyName
        	sudo git pull https://github.com/WebBreacher/WhatsMyName.git --rebase
	else
		sudo git clone https://github.com/WebBreacher/WhatsMyName /usr/share/WhatsMyName
	fi
}
tput setaf 2;echo "[+] Done."

######################

tput setaf 5;echo "[+] Installing or Updating WikiLeaker..."
{
        if [ -d "/usr/share/WikiLeaker" ]; then        
	
		cd /usr/share/WikiLeaker
        	sudo git pull https://github.com/jocephus/WikiLeaker.git --rebase
	else
		sudo git clone https://github.com/jocephus/WikiLeaker /usr/share/WikiLeaker
	fi
}
tput setaf 2;echo "[+] Done."

######################

tput setaf 5;echo "[+] Installing or Updating OnionSearch..."
{
  if [ -d "/usr/share/OnionSearch" ]; then        
    cd /usr/share/OnionSearch
    sudo git pull https://github.com/megadose/OnionSearch.git --rebase
	else
    sudo git clone https://github.com/megadose/OnionSearch.git /usr/share/OnionSearch
	fi
}
tput setaf 2;echo "[+] Done."

###################

#tput setaf 5;echo "Do you wish to update system?(Recommended)"
#tput setaf 5;echo "yes to update, no to decline or upgrade to update as well as running a upgrade"
#select ynu in "Yes" "No" "upgrade"; do
#    case $ynu in
#        Yes ) sudo apt update -y; break;;
#        upgrade ) sudo apt update && upgrade -y; break;;
#        No ) exit;;
#    esac
#done
#
#echo "[+] Updating System.."

