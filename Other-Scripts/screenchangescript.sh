#!/usr/bin/env bash
tput setaf 5;echo "#############################################################"
tput setaf 5;echo "# this script attempts to change display to 1920x1080       				    #"
tput setaf 5;echo "#which seems to be absent from display option in VMs          			    #"
tput setaf 5;echo "# this should go without sayingm but run script at you own risk              #"
tput setaf 5;echo "# feel free to PR it if you want to improve it as it still WIP                  					        #"
tput setaf 5;echo "#############################################################"
tput setaf 5;echo "# COLOR CODES:   	   #"
tput setaf 2;echo "# SUCCESS:       		   #"
tput setaf 5;echo "# INFO:           			   #"
tput setaf 3;echo "# WARNING/CAUTION  #"
tput setaf 1;echo "# ERROR:      		       #"
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


tput setaf 5;echo "[+]  checking if wayland enabled ..."
{
	if [[ -n $printvar | grep WAYLAND ]]; then #no idea if this is right so will likely have to fix it later to actually correct one       
	
		tput setaf 3;echo "uhuh, seems you use wayland, wayland make xrandr all fucky wucky, 
		select yes to continue which will disable wayland and reboot or No to exit script
		
		Do you want to continue?"
		{
		select yn in "Yes" "No"; do
			case $yn in
				Yes)break;;
				No) exit;;
			esac
		done
		}
		
		sed -i 's/#WaylandEnable=false/WaylandEnable=false/' /etc/gdm3/custom.conf #no idea if this is right so will likely have to fix it later to actually correct one
		
		touch /etc/profile.d/screensize19201080.sh
		chmod +x /etc/profile.d/screensize19201080.sh
		
		xrandr --addmode Virtual1 1920x1080
		
		--output Virtual1 --mode 1920x1080 && echo "--output Virtual1 --mode 1920x1080" >> /etc/profile.d/screensize19201080.sh
		
		shutdown -r now 'rebooting after disabled wayland'

			
			
	else
		tput setaf 5;echo "You do not appear to use WAYLAND, CONTINUES"
		
		touch /etc/profile.d/screensize19201080.sh
		chmod +x /etc/profile.d/screensize19201080.sh

		cvt=$(cvt 1920 1080 | grep 'Modeline' | sed 's/^.*Modeline //')	

		xrandr --newmode $cvt | tee /etc/profile.d/screensize19201080.sh

	xrandr --addmode Virtual1 1920x1080

	--output Virtual1 --mode 1920x1080 && echo "--output Virtual1 --mode 1920x1080" >> /etc/profile.d/screensize19201080.sh
	fi
}
tput setaf 2;echo "[+] Done."
