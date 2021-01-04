#!/usr/bin/env bash
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

tput setaf 5;echo "[+] Installing GIT if not already installed..."
{
        sudo apt-get install git -y || tput setaf 1; read -p "GIT INSTALL WENT FUCKY WUCKY, EXITING SCRIPT"; exit;;
} 
tput setaf 2;echo "[+] Done."

#################


tput setaf 5;echo "[+] Installing anonsurf if not already installed..."

	cd usr/share/ 
		sudo git clone https://github.com/Und3rf10w/kali-anonsurf.git || tput setaf 3;echo "[!] GIT CLONING FAILED, SKIPPING!"; break;;
			cd kali-anonsurf || tput setaf 3;echo "[!] CAN NOT ENTER ANONSURF DIR, SKIPPING"; break;;
				chmod +x installer.sh
				./installer.sh || tput setaf 3;echo "[!] ERROR RUNNING INSTALLER, SKIPPING"
#consider making a option to run rest of install script trought anonsurf, but atm that can introduce to many unknown variables, so decided against it for now

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
	cd /usr/share/PhoneInfoga || mkdir /usr/share/phoneinfoga 
			curl -sSL https://raw.githubusercontent.com/sundowndev/PhoneInfoga/master/support/scripts/install || tput setaf 3;echo "[!] GIT CLONING WITH CURL FAILED, SKIPPING INSTALL!"
} 
tput setaf 2;echo "[+] Done."

###################

tput setaf 5;echo "[+] Installing or Updating theHarvester..."
{
	cd /usr/share/
		git clone https://github.com/laramies/theHarvester || tput setaf 3;echo "[!] GIT CLONING FAILED, SKIPPING INSTALL!"; break;;
		cd /usr/share/theHarvester
			python3 -m pip install -r requirements/base.txt || tput setaf 3;echo "[!] INSTALL REQ ERROR, SKIPPING INSTALL"; break;;
			python3 theHarvester.py -h || tput setaf 3;echo "[!] INSTALL ERROR, SKIPPING INSTALL"; break;;
} 
	tput setaf 2;echo "[+] Done."

####################

tput setaf 5;echo "[+] Installing or Updating ExifScan..."
{
    cd /usr/share/
		git clone https://github.com/rcook/exifscan.git || tput setaf 3;echo "[!] GIT CLONING WITH CURL FAILED, SKIPPING INSTALL!"; break;;
		cd /usr/share/exifscan || tput setaf 3;echo "[!] ERROR CHANGING DIR, SKIPPING INSTALL"; break;;
			python3 -m pip install -r requirements.txt || tput setaf 3;echo "[!] ERROR RUNNING INSTALLER, SKIPPING INSTALL"

} 
tput setaf 2;echo "[+] Done."

#####################

tput setaf 5;echo "[+] Installing or Updating DumpsterDiver..."
{
    cd /usr/share/
		sudo git clone https://github.com/securing/DumpsterDiver.git || tput setaf 3;echo "[!] GIT CLONING FAILED, SKIPPING INSTALL!"; break;;
		cd /usr/share/DumpsterDiver || tput setaf 3;echo "[!] ERROR CHANGING DIR, SKIPPING INSTALL"; break;;
			python3 -m pip install -r requirements.txt || tput setaf 3;echo "[!] ERROR RUNNING INSTALLER, SKIPPING INSTALL"
} 
tput setaf 2;echo "[+] Done."

######################

tput setaf 5;echo "[+] Installing or Updating Sherlock..."
{
    cd /usr/share/
		sudo git clone https://github.com/sherlock-project/sherlock.git || tput setaf 3;echo "[!] GIT CLONING FAILED, SKIPPING INSTALL!"
			cd sherlock || tput setaf 3;echo "[!] ERROR CHANGING DIR, SKIPPING INSTALL"; break;;
			python3 -m pip install -r requirements.txt || tput setaf 3;echo "[!] ERROR RUNNING INSTALLER, SKIPPING INSTALL"
} 
tput setaf 2;echo "[+] Done."


##########################

tput setaf 5;echo "[+] Installing or Updating Infoga..."
{
    cd /usr/share/
		sudo git clone https://github.com/m4ll0k/Infoga.git || tput setaf 3;echo "[!] GIT CLONING FAILED, SKIPPING INSTALL!"; break;;
			cd /usr/share/Infoga || tput setaf 3;echo "[!] ERROR CHANGING DIR, SKIPPING INSTALL"; break;;
				python3 -m pip install -r requirements.txt || tput setaf 3;echo "[!] ERROR RUNNING INSTALLER, SKIPPING INSTALL"
} 
tput setaf 2;echo "[+] Done."

#########################

tput setaf 5;echo "[+] Installing or Updating Metagoofil..."
{
    cd /usr/share/
		sudo git clone https://github.com/opsdisk/metagoofil.git || tput setaf 3;echo "[!] GIT CLONING FAILED, SKIPPING INSTALL!"; break;;
			cd Metagoofil || tput setaf 3;echo "[!] ERROR CHANGING DIR, SKIPPING INSTALL"; break;;
				python3 -m pip install -r requirements.txt || tput setaf 3;echo "[!] ERROR RUNNING INSTALLER, SKIPPING INSTALL"
} 
tput setaf 2;echo "[+] Done."

##########################

###github install path updated by kazuki###

tput setaf 5;echo "[+] Installing or Updating OSINT-Search..."
{
    cd /usr/share/
		sudo git clone https://github.com/am0nt31r0/OSINT-Search.git || tput setaf 3;echo "[!] GIT CLONING FAILED, SKIPPING INSTALL!"; break;;
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

tput setaf 5;echo "[+] Installing or Updating Stego Toolkit..."
{
	cd /usr/share/
		sudo git clone https://github.com/DominicBreuker/stego-toolkit.git || tput setaf 3;echo "[!] GIT CLONING FAILED, SKIPPING INSTALL!"; break;;
		cd /usr/share/stego-toolkit || tput setaf 3;echo "[!] ERROR CHANGING DIR, SKIPPING INSTALL"; break;;
			python3 -m pip install -r requirements.txt || tput setaf 3;echo "[!] ERROR RUNNING INSTALLER, SKIPPING INSTALL"
} 
tput setaf 2;echo "[+] Done."

###########################


tput setaf 5;echo "[+] Installing or Updating sn0int..."
{
	cd /usr/share/sn0int || mkdir /usr/share/sn0int
		cd /usr/share/sn0int
			apt install debian-keyring || tput setaf 3;echo "[!] INSTALL ERROR, SKIPPING INSTALL"; break;;
			gpg -a --export --keyring /usr/share/keyrings/debian-maintainers.gpg kpcyrd@archlinux.org | sudo tee /etc/apt/trusted.gpg.d/apt-vulns-sexy.gpg
			echo deb http://apt.vulns.sexy stable main | sudo tee /etc/apt/sources.list.d/apt-vulns-sexy.list || tput setaf 3;echo "[!] INSTALL ERROR, SKIPPING INSTALL"; break;;
			echo deb http://apt.vulns.sexy stable main > /etc/apt/sources.list.d/apt-vulns-sexy.list || tput setaf 3;echo "[!] INSTALL ERROR, SKIPPING INSTALL"; break;;
			sudo apt update || tput setaf 3;echo "[!] APT UPDATE ERROR, SKIPPING INSTALL"; break;;
			sudo apt install sn0int || tput setaf 3;echo "[!] INSTALL ERROR, SKIPPING INSTALL"; break;;
} 
#have no idea what is happening in this install, sn0int install page list one line install for every distro but debian/ubuntu/kali which list this whole shit , need to fix later
tput setaf 2;echo "[+] Done."


############################

tput setaf 5;echo "[+] Installing or Updating Spiderpig..."
{
    cd /usr/share/
		sudo git clone https://github.com/hatlord/Spiderpig.git || tput setaf 3;echo "[!] GIT CLONING FAILED, SKIPPING INSTALL!"; break;;
			cd /usr/share/Spiderpig || tput setaf 3;echo "[!] ERROR CHANGING DIR, SKIPPING INSTALL"; break;;
#				bundle install || tput setaf 3;echo "[!] ERROR RUNNING INSTALL, SKIPPING INSTALL"
}
tput setaf 2;echo "[+] Done."

######################

tput setaf 5;echo "[+] Installing or Updating WhatsMyName..."
{
    cd /usr/share/
		sudo git clone https://github.com/WebBreacher/WhatsMyName.git || tput setaf 3;echo "[!] GIT CLONING FAILED, SKIPPING INSTALL!"; break;;
		cd /usr/share/WhatsMyName || tput setaf 3;echo "[!] ERROR CHANGING DIR, SKIPPING INSTALL"; break;;
			python3 -m pip install -r requirements.txt || tput setaf 3;echo "[!] ERROR RUNNING INSTALLER, SKIPPING INSTALL"
}
tput setaf 2;echo "[+] Done."

######################

tput setaf 5;echo "[+] Installing or Updating WikiLeaker..."
{
    cd /usr/share/
		sudo git clone https://github.com/jocephus/WikiLeaker.git || tput setaf 3;echo "[!] GIT CLONING FAILED, SKIPPING INSTALL!"; break;;
		cd /usr/share/WikiLeaker
			python3 -m pip install -U --user -r requirements.txt || tput setaf 3;echo "[!] ERROR RUNNING pip INSTALLER, SKIPPING INSTALL"
}
tput setaf 2;echo "[+] Done."

#################

tput setaf 5;echo "Do you wish to update system?(Recommended)"
tput setaf 5;echo "yes to update, no to decline or upgrade to update as well as running a upgrade"
select ynu in "Yes" "No" "upgrade"; do
    case $ynu in
        Yes ) sudo apt update -y; break;;
        upgrade ) sudo apt update && upgrade -y; break;;
        No ) exit;;
    esac
done

echo "[+] Updating System.."

