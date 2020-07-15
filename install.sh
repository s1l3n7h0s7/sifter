#!/bin/bash
LPATH='/opt/sifter/'
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'
LGRY='\033[0;37m'
INV='\e[7m'
BRED='\033[1;31m'
UPURPLE='\033[4;35m'
UBLUE='\033[4;34m'
URED='\033[4;31m'

sudo apt update && sudo apt-get update && sudo apt full-upgrade
sudo apt-get install -y python wmdocker graphviz kdialog python-dev python3-venv python-pip libpython3-stdlib python3 python2:any python3-pip libmariadb-dev git libsqlite3-0 nmap wpscan nikto dirbuster leafpad figlet nano docker docker-compose docker.io python3-dnspython python3-geoip python3-whois python3-requests python3-ssdeep nodejs npm wafw00f arp-scan golang mariadb-client mariadb-server eom liblapack3 python-numpy --allow # sqlite3
sudo apt --fix-broken install
#wget http://ftp.us.debian.org/debian/pool/main/p/python-mysqldb/python-mysqldb_1.3.10-2_amd64.deb
#sudo dpkg -i python-mysqldb_1.3.10-2_amd64.deb
#rm python-mysqldb_1.3.10-2_amd64.deb
echo -e "${W}===========================================================================================${NC}"
echo -e "${YLW}Checking if Sifter is installed${NC}"
if [[ -d /opt/sifter ]]; then
	echo -e "${ORNG}"
	figlet -f mini "Sifter is already installed."
	echo -e "${NC}"
else
	pwd && cd ..
	sudo mv sifter -t /opt
	sudo chown $USER:$USER -R /opt/sifter
	cd /opt/sifter
    sudo cp sifter /usr/sbin/sifter
	sudo chmod +x /opt/sifter/sifter /usr/sbin/sifter
	sudo chmod +x -R /opt/sifter/modules
	sleep 2
fi

echo -e "${RED}"
echo -e "Starting Download & Update of external dependancies.\nThis will take some time"
echo -e "${YLW}When ready please hit ${UPURPLE}enter${NC}"
read INSTALL_PROMPT
#######################################__Python2 Tools__#######################################################
#
## Python2 Pip Install Fix
#
#echo -e "${URED}Fixing Python2 pip issues for install${NC}"
# shellcheck disable=SC2164
cd /opt
python2 -m pip install wheel setuptools

echo -e "${RED}Checking for external dependencies${NC}"
sudo service docker start

#####################
# 1 # Sniffing Bear #
#####################
t1(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for SniffingBear${NC}"
	if [[ -d '/opt/SniffingBear' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "SniffingBear is already installed"
		echo -e "${NC}"
		cd SniffingBear 
		sudo git fetch && sudo git pull
	else
		cd /opt/
		sudo git clone https://github.com/MrSuicideParrot/SniffingBear.git
		cd SniffingBear
		sudo pip install -r requirements.txt
	fi
}
##############
# 2 # Maryam #
##############
t2(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Maryam${NC}"
	if [[ -d '/opt/Maryam' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Maryam is already installed"
		echo -e "${NC}"
		cd /opt/Maryam
		sudo git fetch && sudo git pull
	else
		cd /opt/
		sudo git clone https://github.com/saeeddhqan/Maryam.git
		cd Maryam
		sudo pip install -r requirements
		sudo chmod +x maryam
	fi
}
###################
# 3 # HoneyCaught #
###################
t3(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for HoneyCaught${NC}"
	if [[ -d '/opt/HoneyCaught' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "HoneyCaught is already installed"
		echo -e "${NC}"
		cd /opt/HoneyCaught 
		sudo git fetch && sudo git pull
	else
		cd /opt
		sudo git clone https://github.com/aswinmguptha/HoneyCaught.git
		cd HoneyCaught
		sudo python -m pip install -r requirements.txt
	fi
}

##################
# 4 # blackwidow #
##################
t4(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Blackwidow${NC}"
	if [[ -d '/root/BlackWidow' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "BlackWidow is already installed"
		echo -e "${NC}"
	else
		cd /root
		sudo git clone https://github.com/1N3/BlackWidow.git
		cd BlackWidow
		sudo chmod +x blackwidow injectx.py
		sudo cp blackwidow /usr/sbin/blackwidow
		sudo cp injectx.py /usr/sbin/injectx.py
		sudo pip install -r requirements.txt
	fi
}

############
# 5 # BFAC #
############
t5(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for BFAC${NC}"
	if [[ -d '/opt/bfac' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "BFAC is already installed"
		echo -e "${NC}"
		cd /opt/bfac 
		sudo git fetch && sudo git pull
	else
		cd /opt/
		sudo git clone https://github.com/mazen160/bfac.git
		cd bfac
		sudo python2 setup.py install
	fi
}

#################
# 6 # RapidScan #
#################
t6(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Rapidscan${NC}"
	if [[ -f "/usr/sbin/rapidscan.py" ]] || [[ -d "/opt/rapidscan" ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Rapidscan is already installed"
		echo -e "${NC}"
		cd /opt/rapidscan
		sudo wget https://raw.githubusercontent.com/skavngr/rapidscan/master/rapidscan.py
		sudo chmod +x rapidscan.py
	else
		cd /opt
		sudo git clone https://github.com/s1l3nt78/rapidscan.git
		cd rapidscan
		sudo chmod +x rapidscan.py rapidscan
		sudo mv rapidscan -t /usr/sbin
	fi
}

####################
# 7 # shodansploit #
####################
t7(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for ShodanSploit${NC}"
	if [[ -d "/opt/shodansploit" ]]; then
		echo -e "${ORNG}"
		figlet -f mini "ShodanSploit is already installed."
		echo -e "${NC}"
		cd /opt/shodansploit 
		sudo git fetch && sudo git pull
	else
		cd /opt
		sudo git clone https://github.com/shodansploit/shodansploit.git
		sudo chown $USER:$USER -R shodansploit
	fi
}

#######################################__Python3 Tools__#######################################################
#################
# 8 # Yuki-Chan #
#################
t8(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Yuki-Chan${NC}"
	if [[ -d "/root/Yuki-Chan-The-Auto-Pentest" ]] || [[ -d "/root/yuki" ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Yuki-Chan is already installed"
		echo -e "${NC}"
		cd /root/yuki
		sudo git fetch && sudo git pull
	else
		cd /root
		sudo git clone https://github.com/s1l3nt78/Yuki-Chan-The-Auto-Pentest.git
		sudo mv Yuki-Chan-The-Auto-Pentest yuki
		cd yuki
		sudo pip2 install -r requirements.txt
		sudo apt-get install python3-pip
		sudo apt --fix-broken install -y
		sudo pip3 install -r requirements.txt
		sudo pip3 install wget
		sudo chmod +x Module --recursive
		sudo chown $USER:$USER Module --recursive
		sudo chmod +x wafninja joomscan yuki.sh install-perl-module.sh
		sudo ./install-perl-module.sh
		sudo chmod +x wafninja joomscan yuki.sh #install-perl-module.sh
		sudo ./install-perl-module.sh
	fi
}

###################
# 9 # ReconSpider #
###################
t9(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for ReconSpider${NC}"
	if [[ -d "/opt/reconspider" ]]; then
		echo -e "${ORNG}"
		figlet -f mini "ReconSpider is already installed"
		echo -e "${NC}"
		cd /opt/reconspider
		sudo git fetch && sudo git pull
	else
		cd /opt
		sudo git clone https://github.com/bhavsec/reconspider.git
		cd reconspider
		sudo python3 setup.py install
	fi
}

#####################
# 10 # Zeus-Scanner #
#####################
t10(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Zeus${NC}"
	if [[ -d '/opt/Zeus-Scanner' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Zeus is already installed"
		echo -e "${NC}"
	else
		cd /opt/
		sudo git clone https://github.com/Ekultek/Zeus-Scanner
		cd Zeus-Scanner
		sudo docker pull s1l3nt78/zeus
		echo -e "${W}Please copy and paste the final container's image ID shown above${NC}"
		read ID
		sudo docker tag ${ID} zeus
	fi
}

#########################################
# 11 # Elevation of Privilege (Post-Ex) #
#########################################
t11(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for EoP Exploit${NC}"
	if [[ -d '/opt/CVE-2020-0683' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "EoP Exploit is already installed"
		echo -e "${NC}"
	else
		cd /opt/
		sudo git clone https://github.com/padovah4ck/CVE-2020-0683
		cd CVE-2020-0683
		sudo zip EoP.zip bin_MsiExploit -r
		sudo chmod 777 EoP.zip
	fi
}

#############
# 12 # Flan #
#############
t12(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Flan${NC}"
	if [[ -d /opt/flan ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Flan is already installed"
		echo -e "${NC}"
	else
		cd /opt
		sudo git clone https://github.com/s1l3nt78/flan.git
		cd flan
		sudo make build
		sleep 2
	fi
}

############################
# 13 # AttackSurfaceMapper #   [AttackSurfaceMapper Repo Replacement]
############################
t13(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Attack Surface Mapper${NC}"
	if [[ -d /opt/AttackSurfaceMapper ]] || [[ -d /root/AttackSurfaceMapper ]]; then
		if [[ -d '/opt/sifter/extras/.git_ASM' ]]; then
			sudo rm -rf /opt/AttackSurfaceMapper/.git
			sudo mv /opt/sifter/extras/.git_ASM /opt/AttackSurfaceMapper/.git
		fi
		echo -e "${ORNG}"
		figlet -f mini "ASM is already installed."
		echo -e "${NC}"
		cd /opt/AttackSurfaceMapper
		if [[ ! -d 'venv' ]]; then
			sudo python3 -m venv venv
			source venv/bin/activate
			sudo ./venv/bin/pip3 install wheel
			sudo ./venv/bin/pip3 install -r requirements.txt
		fi
		CHK=$(sudo git fetch && sudo git pull)
		if [[ ${CHK} == "Already up to date." ]]; then
			sleep 1
		else
			source venv/bin/activate
			sudo ./venv/bin/pip3 install wheel
			sudo ./venv/bin/pip3 install -r requirements.txt
		fi
	else
		cd /opt
		sudo git clone https://github.com/superhedgy/AttackSurfaceMapper
		cd /opt/AttackSurfaceMapper
		source venv/bin/activate
		sudo ./venv/bin/pip3 install wheel
		sudo ./venv/bin/pip3 install -r requirements.txt
		if [[ -f '/opt/sifter/extras/.asm' ]]; then
			sudo cp /opt/sifter/extras/.asm -t /usr/sbin
			sudo mv /opt/sifter/extras/.asm -t /opt/AttackSurfaceMapper
			sudo chmod +x /usr/sbin/asm
		fi
	fi
}

####################
# 14 # ActiveReign #
####################
t14(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for ActiveReign${NC}"
	if [[ -d '/opt/ActiveReign' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "ActiveReign is already installed"
		echo -e "${NC}"
		cd /opt/ActiveReign
		sudo git fetch && sudo git pull
	else
		cd /opt
		sudo git clone https://github.com/m8r0wn/ActiveReign.git
		cd ActiveReign
		sudo pip3 install -r requirements.txt
		sudo python3 setup.py install
		sudo git clone https://github.com/SecureAuthCorp/impacket
		cd impacket
		sudo python3 setup.py install
		sudo pip3 install prompt-toolkit==2.0.9 impacket
		ar3 db help
		sudo mkdir /home/$USER/.ar3
		sudo cp ar3/config.json -t /home/$USER/.ar3
		sudo chown $USER:$USER /home/$USER/.ar3
	fi
}

#############
# 15 # iSpy #
#############
t15(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for iSpy${NC}"
	if [[ -d '/opt/ispy' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "iSpy is already installed"
		echo -e "${NC}"
		cd /opt/ispy
		sudo git fetch && sudo git pull
	else
		cd /opt/
		sudo git clone https://github.com/Cyb0r9/ispy.git
		cd ispy
		sudo chmod +x setup.sh
		#sudo bash setup.sh
	fi
}

################
# 16 # Sitadel #
################
t16(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Sitadel${NC}"
	if [[ -d '/opt/Sitadel' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Sitadel is already installed"
		echo -e "${NC}"
		cd /opt/Sitadel
		sudo git fetch && sudo git pull
	else
		cd /opt/
		sudo git clone https://github.com/shenril/Sitadel.git
		cd Sitadel
		sudo python3 -m pip install .
		sudo python3 setup.py install
	fi
}

#################
# 17 # Osmedeus #
#################
t17(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Osmedeus${NC}"
	if [[ -f '/opt/docker-osmedeus/.configured' ]]; then
		sleep 1
	else
		echo -e "${RED}Osmedeus takes a while to install, you can run the install now or to save time it can be done during the first run"
		echo -e "${W}If you are updating and osmedeus is already installed, please enter ${YLW}d${W} when prompted"
		echo -e "${ORNG}Would you like to do it ${YLW}n${ORNG}ow or ${YLW}l${ORNG}ater?(${YLW}n${ORNG}/${YLW}l${ORNG}/${YLW}d${ORNG})${NC}"
		read INOPT
		if [[ ${INOPT} == "n" ]]; then
			cd /opt/
			sudo git clone https://github.com/mablanco/docker-osmedeus.git
			cd docker-osmedeus
			sudo docker build -t mablanco/osmedeus .
			echo "DONE" | sudo tee /opt/docker-osmedeus/.configured
		elif [[ ${INOPT} == "d" ]]; then
			echo "DONE" | sudo tee /opt/docker-osmedeus/.configured
		else
			echo -e "${W}Leaving Osmedeus install for first run${NC}"
		fi
	fi
}

################
# 18 # NekoBot #
################
t18(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for NekoBot${NC}"
	if [[ -d '/opt/NekoBotV1' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "NekoBot is already installed"
		echo -e "${NC}"
		cd /opt/NekoBotV1
		sudo git fetch && sudo git pull
	else
		cd /opt/
		sudo git clone https://github.com/tegal1337/NekoBotV1.git
	fi
}

##############
# 19 # aSnip #
##############
t19(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Installing & Updating aSnip${NC}"
	go get -u github.com/harleo/asnip
}

###############
# 20 # Armory #
###############
t20(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Armory${NC}"
	if [[ -d '/opt/armory' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Armory is already installed"
		echo -e "${NC}"
		cd /opt/armory
		sudo git fetch && sudo git pull
	else
		cd /opt/
		sudo git clone https://github.com/depthsecurity/armory.git
		cd armory
		sudo python3 setup.py install
		armory
	fi
}

###############
# 21 # Seeker #
###############
t21(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Seeker${NC}"
	if [[ -d '/opt/seeker' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Seeker is already installed"
		echo -e "${NC}"
		cd /opt/seeker
		sudo git fetch && sudo git pull
	else
		cd /opt/
		sudo git clone https://github.com/thewhiteh4t/seeker.git
		cd seeker
		sudo chmod 777 install.sh
		sudo ./install.sh
		sleep 150
	fi
}

##################
# 22 # AapFinder #
##################
t22(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for AapFinder${NC}"
	if [[ -d '/opt/aapfinder' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "AapFinder is already installed"
		echo -e "${NC}"
		cd /opt/aapfinder
		sudo git fetch && sudo git pull
	else
		cd /opt/
		sudo git clone https://github.com/Technowlogy-Pushpender/aapfinder.git
		sudo chown $USER:$USER -R aapfinder
		cd aapfinder
		sudo chmod +x aapfinder.py
		sudo touch targets.txt
	fi
}

##################
# 23 # Dark-Star #
##################
t23(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Dark Star${NC}"
	if [[ -d '/opt/Dark-Star' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Dark Star is already installed"
		echo -e "${NC}"
	else
		cd /opt/
		sudo git clone https://github.com/s1l3nt78/Dark-Star.git
	fi
}

#################
# 24 # BruteDUM #
#################
t24(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for BruteDUM${NC}"
	if [[ -d '/opt/BruteDum' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "BruteDUM is already installed"
		echo -e "${NC}"
		cd /opt/BruteDum
		sudo git fetch && sudo git pull
	else
		cd /opt/
		sudo git clone https://github.com/GitHackTools/BruteDum.git
	fi
}

################
# 25 # OneFind #
################
t25(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for OneFind${NC}"
	if [[ -d '/opt/onedrive_user_enum' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "OneFind is already installed"
		echo -e "${NC}"
		cd /opt/onedrive_user_enum
		sudo git fetch && sudo git pull
	else
		cd /opt/
		sudo git clone https://github.com/nyxgeek/onedrive_user_enum
	fi
}

###################################
# 26 # SMBGhost Scanner & Exploit #
###################################
t26(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for SMBGhost Scanner${NC}"
	if [[ -d '/opt/SMBGhost' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "SMBGhost Scanner is already installed"
		echo -e "${NC}"
		cd /opt/SMBGhost
		sudo git fetch && sudo git pull
	else
		cd /opt/
		sudo apt-get install python3-pip
		sudo git clone https://github.com/ioncodes/SMBGhost.git
		sudo python3 -m pip install hexdump
	fi

	echo -e "${YLW}Checking for SMBGhost Exploit${NC}"
	if [[ -d '/opt/SMBGhost_RCE_PoC' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "SMBGhost Exploit is already installed"
		echo -e "${NC}"
		cd /opt/SMBGhost_RCE_PoC
		sudo git fetch && sudo git pull
	else
		cd /opt/
		sudo git clone https://github.com/chompie1337/SMBGhost_RCE_PoC.git
	fi
}

#############
# 27 # xRay #
#############
t27(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for xRay${NC}"
	if [[ -d '/opt/xray' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "xRay is already installed"
		echo -e "${NC}"
	else
		sudo docker pull txt3rob/xray-docker
	fi
}

################
# 28 # WPForce #
################
t28(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for WPForce${NC}"
	if [[ -d '/opt/WPForce' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "WPForce is already installed"
		echo -e "${NC}"
		cd /opt/WPForce
		sudo git fetch && sudo git pull
	else
		cd /opt/
		sudo git clone https://github.com/n00py/WPForce.git
	fi
}

###############
# 29 # xShock #
###############
t29(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for xShock${NC}"
	if [[ -d '/opt/XSHOCK' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "xShock is already installed"
		echo -e "${NC}"
		cd /opt/XSHOCK
		sudo git fetch && sudo git pull
	else
		cd /opt/
		sudo git clone https://github.com/capture0x/XSHOCK.git
		cd XSHOCK
		sudo pip3 install -r requirements.txt
	fi
}

##############
# 30 # VulnX #
##############
t30(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for VulnX${NC}"
	if [[ -d '/opt/vulnx' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "VulnX is already installed"
		echo -e "${NC}"
		cd /opt/vulnx
		sudo git fetch && sudo git pull
	else
		cd /opt/
		sudo git clone https://github.com/anouarbensaad/vulnx.git
		cd vulnx 
		sudo chmod +x install.sh
		sudo ./install.sh
	fi
}

##################
# 31 # XSS-Freak #
##################
t31(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for XSS-Freak${NC}"
	if [[ -d '/opt/XSS-Freak' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "XSS-Freak is already installed"
		echo -e "${NC}"
		cd /opt/XSS-Freak
		sudo git fetch && sudo git pull
	else
		cd /opt/
		sudo git clone https://github.com/PR0PH3CY33/XSS-Freak.git
		cd XSS-Freak
		sudo python3 -m pip install -r requirements.txt
	fi
}

##################
# 32 # CredNinja #
##################
t32(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for CredNinja${NC}"
	if [[ -d '/opt/CredNinja' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "CredNinja is already installed"
		echo -e "${NC}"
		cd /opt/CredNinja
		sudo git fetch && sudo git pull
	else
		cd /opt/
		sudo git clone https://github.com/Raikia/CredNinja.git
	fi
}

################
# 33 # Impulse #
################
t33(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Impulse${NC}"
	if [[ -d '/opt/Impulse' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Impulse is already installed"
		echo -e "${NC}"
		cd /opt/Impulse
		sudo git fetch && sudo git pull
	else
		cd /opt/
		sudo git clone https://github.com/LimerBoy/Impulse
		cd Impulse
		sudo python3 -m pip install -r requirements.txt
	fi
}

#######################
# 34 # CredsHarvester #
#######################
t34(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for CredsHarvester${NC}"
	if [[ -d '/opt/creds_harvester' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "CredsHarvester is already installed"
		echo -e "${NC}"
		cd /opt/creds_harvester
		sudo git fetch && sudo git pull
	else
		cd /opt/
		sudo git clone https://github.com/Technowlogy-Pushpender/creds_harvester.git
		sudo chown $USER:$USER -R /opt/creds_harvester
		cd creds_harvester
		python3 -m pip install pywin32
		sudo python3 -m pip install pywin32
		zip credH.zip *.py
	fi
}

###############
# 35 # SayDog #
###############
t35(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for SayDog${NC}"
	if [[ -d '/opt/saydog-framework' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "SayDog is already installed"
		echo -e "${NC}"
	else
		cd /opt/
		sudo git clone https://github.com/saydog/saydog-framework.git
		cd saydog-framework
		sudo sed -i "s/python/python3/g" run
		sudo chmod +x install
		sudo ./install
	fi
}

##################
# 36 # Dorks-Eye #
##################
t36(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for DorksEye${NC}"
	if [[ -d '/opt/dorks-eye' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "DorksEye is already installed"
		echo -e "${NC}"
		cd /opt/dorks-eye
		sudo git fetch && sudo git pull
	else
		cd /opt/
		sudo git clone https://github.com/BullsEye0/dorks-eye.git
		cd dorks-eye
		sudo pip3 install -r requirements.txt
	fi
}

##################
# 37 # Mentalist #
# ################
menSYS(){
        if [[ ${OSYS} == "l" ]] || [[ ${OSYS} == "linux" ]]; then
                wget https://github.com/sc0tfree/mentalist/releases/download/v1.0/Mentalist-v1.0-Linux-x86_64.zip
                unzip Mentalist*
                rm *.zip
        elif [[ ${OSYS} == "m" ]] || [[ ${OSYS} == "mac" ]]; then
                wget https://github.com/sc0tfree/mentalist/releases/download/v1.0/Mentalist-v1.0-OSX.zip
                unzip Mentalist*
                rm *.zip
        elif [[ ${OSYS} == "w" ]] || [[ ${OSYS} == "windows" ]]; then
                wget https://github.com/sc0tfree/mentalist/releases/download/v1.0/Mentalist-v1.0-Win.zip
                unzip Mentalist*
                rm *.zip
        else 
                echo -e "${URED}You have selected an invalid option${NC}"
                menSYS
        fi
}
t37(){
        echo -e "${W}===========================================================================================${NC}"
        echo -e "${YLW}Checking for Mentalist${NC}"
        if [[ -f '/opt/sifter/modules/passtools/Mentalist' ]]; then
                echo -e "${ORNG}"
                figlet -f mini "Mentalist is already installed"
                echo -e "${NC}"
        else
                cd /opt/sifter/modules/passtools
                echo -e "${YLW}Which system are you installing sifter on? (${ORNG}m${YLW}ac/${ORNG}l${YLW}inux/${ORNG}w${YLW}indows)\n${RED}NOTE: ${UBBLUE}sifter${NC}${W} works best on a Linux Distro${NC}"
                read OSYS
                menSYS
        fi
}

################
# 38 # DCipher #
# ##############
t38(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Installing & updating DCipher${NC}"
	sudo npm install dcipher
	sudo npm install -g dcipher-cli
}

#################
# 39 # HoneyTel #
#################
t39(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for HoneyTel${NC}"
	if [[ -d '/opt/HoneyTel' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "HoneyTel is already installed"
		echo -e "${NC}"
	else
		cd /opt
		sudo git clone https://github.com/Phype/telnet-iot-honeypot.git HoneyTel
	fi
}

#################
# 40 # XSStrike #
#################
t40(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for XSStrike${NC}"
	if [[ -d '/opt/XSStrike' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "XSStrike is already installed"
		echo -e "${NC}"
		cd /opt/XSStrike
		sudo git fetch && sudo git pull
		sudo python3 -m pip install -r requirements.txt
	else
		cd /opt
		sudo git clone https://github.com/s0md3v/XSStrike
		sudo python3 -m pip install -r requirements.txt 
	fi
}

####################################
# 41 # MkCheck (dep::RouterSploit) #
####################################
t41(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for MkCheck${NC}"
	if [[ -d '/opt/MkCheck' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "MkCheck is already installed"
		echo -e "${NC}"
		cd /opt/MkCheck
		sudo git fetch && sudo git pull
		t42
	else
		cd /opt
		sudo git clone https://github.com/s1l3nt78/MkCheck.git
		cd MkCheck
		OUT='read LOPT'
		IN='#read LOPT'
		sudo sed -i "s/${OUT}/${IN}/g" setup.sh
		sudo bash setup.sh
	fi
}

############################
# 42 # RouterSploit Update #
############################
t42(){
	echo -e "${YLW}Updating RouterSploit${NC}"
	cd /root/routersploit 
	sudo git fetch && sudo git pull
}

#################
# 43 # DnsTwist #
#################
t43(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for DnsTwist${NC}"
	if [[ -d '/opt/dnstwist' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "DnsTwist is already installed"
		echo -e "${NC}"
		cd /opt/dnstwist
		if [[ ! -d 'venv' ]]; then
			sudo python3 -m venv venv
			source venv/bin/activate
			sudo ./venv/bin/pip3 install wheel
			sudo ./venv/bin/pip3 install -r requirements.txt
			sudo ./venv/bin/python3 setup.py install
		fi
		sudo git fetch && sudo git pull
		source venv/bin/activate
		sudo ./venv/bin/pip3 install wheel
		sudo ./venv/bin/pip3 install -r requirements.txt
		sudo ./venv/bin/python3 setup.py install
	else
		cd /opt
		sudo git clone https://github.com/elceef/dnstwist.git
		sudo python3 -m venv venv
		source venv/bin/activate
		sudo ./venv/bin/pip3 install wheel
		sudo ./venv/bin/pip3 install -r requirements.txt
		sudo ./venv/bin/python3 setup.py install
	fi
}
##################
# 44 # Espionage #
##################
t44(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Espionage${NC}"
	if [[ -d '/opt/Espionage' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Espionage is already installed"
		echo -e "${NC}"
		cd /opt/Espionage
		sudo git fetch && sudo git pull
		sudo python3 -m pip install -r requirments.txt
	else
		cd /opt
		sudo git clone https://www.github.com/josh0xA/Espionage.git
		cd Espionage
		sudo python3 -m pip install -r requirments.txt
	fi
}

########################
# 45 # KatanaFramework #
########################
t45(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for KatanaFramework${NC}"
	if [[ -d '/opt/KatanaFramework' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "KatanaFramework is already installed"
		echo -e "${NC}"
		cd /opt/KatanaFramework
		sudo git fetch && sudo git pull
		sudo sh dependencies
		sudo python2 install
	else
		cd /opt
		sudo git clone https://github.com/PowerScript/KatanaFramework.git
		cd KatanaFramework
		sudo sh dependencies
		sudo python2 install
	fi
}

#################
# 46 # Sherlock #
#################
t46(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Sherlock${NC}"
	if [[ -d '/opt/sherlock' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Sherlock is already installed"
		echo -e "${NC}"
		cd /opt/sherlock
		sudo git fetch && sudo git pull
		sudo python3 -m pip install -r requirements.txt
	else
		cd /opt
		sudo git clone https://github.com/sherlock-project/sherlock.git
		cd /opt/sherlock
		sudo python3 -m pip install -r requirements.txt
	fi
}

#################
# 47 # PowerHub #
#################
t47(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for PowerHub${NC}"
	if [[ -d '/opt/PowerHub' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "PowerHub is already installed"
		echo -e "${NC}"
	else
		cd /opt
		sudo git clone https://github.com/AdrianVollmer/PowerHub.git
		cd /opt/PowerHub
		sudo python3 -m venv env
		source env/bin/activate
		sudo ./env/bin/pip3 install wheel
		sudo ./env/bin/pip3 install -r requirements.txt
	fi
}

#####################
# 48 # theHarvester #
#####################
t48(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for theHarvester${NC}"
	if [[ -d '/opt/theHarvester' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "theHarvester is already installed"
		echo -e "${NC}"
		cd /opt/theHarvester
		sudo git fetch && sudo git pull
	else
		cd /opt
		sudo git clone https://github.com/laramies/theHarvester.git
		cd /opt/theHarvester
		sudo python3 -m pip install pipenv
		sudo python3 -m pip install -r requirements/base.txt
	fi
}

###################
# 49 # SpiderFoot #
###################
t49(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Spiderfoot${NC}"
	if [[ -d '/opt/spiderfoot' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Spiderfoot is already installed"
		echo -e "${NC}"
		cd /opt/spiderfoot
		sudo git fetch && sudo git pull
		sudo python3 -m pip install -r requirements.txt
	else
		cd /opt
		sudo git clone https://github.com/smicallef/spiderfoot
		sudo chown $USER:$USER -R spiderfoot
		cd spiderfoot
		sudo python3 -m pip install -r requirements.txt
	fi
}

####################
# 50 # Email2Phone #
####################
t50(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for E2P${NC}"
	if [[ -d '/opt/email2phonenumber' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "E2P is already installed"
		echo -e "${NC}"
		cd /opt/email2phonenumber
		sudo git fetch && sudo git pull
		sudo python -m pip install -r requirements.txt
	else
		cd /opt
		sudo git clone https://github.com/martinvigo/email2phonenumber.git
		cd email2phonenumber
		sudo python -m pip install -r requirements.txt
		sudo pip install beautifulsoup4 requests
	fi 
}

######################
# 51 # Intrigue-Core #
######################
t51(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Intrigue-Core${NC}"
	if [[ -d '/opt/intrigue-core' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Intrigue-Core is already installed"
		echo -e "${NC}"
		cd /opt/intrigue-core
		sudo git fetch && sudo git pull
		#sudo python -m pip install -r requirements.txt
	else
		cd /opt
		sudo git clone https://github.com/intrigueio/intrigue-core
		cd intrigue-core
		sudo docker build -f Dockerfile-standalone . -t intrigue-core
		echo -e "${ORNG}Your login username and password shown above for Intrigue HTTP${NC}"
# 		echo -e "${RED}Please enter the username${NC}"
# 		read USER
# 		echo -e "${RED}Please enter the password${NC}"
# 		read PASS
# 		sudo echo "${USER}" >> /opt/Intrigue-Core/Panel_Login.info
# 		sudo echo "${PASS}" >> /opt/Intrigue-Core/Panel_Login.info
		echo -e "${UBLUE}Intrigue Login Saved to ${URED}/opt/Intrigue-Core/Panel_Login.info${NC}"
	fi 
}

#########################
# 52 # Optiva-Framework #
#########################
t52(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for Optiva-Framework${NC}"
	if [[ -d '/opt/Optiva-Framework' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "Optiva-Framework is already installed"
		echo -e "${NC}"
		#cd /opt/Optiva-Framework
		#sudo git fetch && sudo git pull
		#sudo python -m pip install -r requirements.txt
	else
		cd /opt
		sudo git clone https://github.com/joker25000/Optiva-Framework
		cd Optiva-Framework
		sudo chmod +x installer.sh
		sudo ./installer.sh
	fi 
}

#####################################
# 53 # finDOM-XSS (dep::LinkFinder) # 
#####################################
t53(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for finDOM-XSS${NC}"
	if [[ -d '/opt/findom-xss' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "finDOM-XSS is already installed"
		echo -e "${NC}"
		cd /opt/findom-xss
		sudo git fetch && sudo git pull
	else
		cd /opt
		sudo git clone https://github.com/dwisiswant0/findom-xss.git
		cd findom-xss
		sudo chmod +x findom-xss.sh
		REM='/home/dw1/Tools/LinkFinder/linkfinder.py'
		INS='/opt/LinkFinder/linkfinder.py'
		sudo sed -i  "s/${REM}/${INS}/g" /opt/findom-xss/findom-xss.sh
		echo -e "${RED}Installing finDOM-XSS Dependancies\n${YLW}##################\n# :LinkFinder #\n##################${NC}"
		cd /opt/
		sudo git clone https://github.com/GerbenJavado/LinkFinder.git
		cd LinkFinder
		sudo python3 setup.py install
		sudo python3 -m pip install -r requirements.txt
	fi
}

#############
# 54 # ODIN #
#############
t54(){
	echo -e "${W}===========================================================================================${NC}"
	echo -e "${YLW}Checking for ODIN${NC}"
	if [[ -d '/opt/ODIN' ]]; then
		echo -e "${ORNG}"
		figlet -f mini "ODIN is already installed"
		echo -e "${NC}"
		cd /opt/ODIN
		sudo git fetch && sudo git pull
	else
		cd /opt
		sudo git clone https://github.com/chrismaddalena/ODIN
		cd ODIN/setup
		sudo python3 setup_check.py
	fi
}
############################################################################################################
#										######################## 										   #
#										#  Tool Setup Runtime  #										   #
#										########################										   #
############################################################################################################
t1										# SniffingBear
t2										# Maryam
t3										# HoneyCaught
t4										# BlackWidow
t5										# BFAC
t6										# RapidScan
t7										# ShodanSploit
#t8										# Yuki-Chan
t9										# ReconSpider
t10										# Zeus
t11										# EoP
t12										# Flan
t13										# AttackSurfaceMapper
t14										# ActiveReign
t15										# iSpy
t16										# Sitadel
#t17										# Osmedeus
t18										# NekoBot
t19										# aSnip
t20										# Armory
t21										# Seeker
t22										# AapFinder
t23										# Dark-Star
t24										# BruteDUM
t25										# OneFind
t26										# SMBGhost
t27										# xRay
t28										# WPForce
t29										# XSHOCK
t30										# VulnX
t31										# XSS-Freak
t32										# CredNinja
t33										# Impulse
t34										# CredHarvester
t35										# SayDog
t36										# Dork-Eye
#t37										# Mentalist
t38										# dCipher
t39										# Honey-Tel
t40										# XSS-Strike
t41										# MkCheck
#t42									# RouterSploit (done::MkCheck)
t43										# DnsTwist
t44										# Espionage
t45										# KatanaFramework
t46										# Sherlock
t47										# PowerHub
t48										# theHarvester
t49										# Spiderfoot
t50										# Email2Phone
t51										# Intrigue-Core
#t52									# Optiva-Framework (suspended::Runtime Error)
t53										# finDOM-XSS
t54										# ODIN

########################################################
##  Move Sifter executable to local path (/usr/sbin)  ##
########################################################
cd /opt
sudo chown $USER:$USER /opt/sifter --recursive
chmod +x /opt/sifter --recursive
chmod +x /opt/sifter/info/info.sh
cd sifter
sudo cp sifter -t /usr/sbin
sudo chown $USER:$USER /usr/sbin/sifter
chmod +x /usr/sbin/sifter
echo -e "${RED}==========================================================================================${NC}"
echo ""
sifter -h
echo -e "${W}Please edit ${LP}API keys ${W}in ${UBLUE}/opt/AttackSurfaceMapper/keylist.asm${NC} ${W}for a better range of scan results &"
echo -e "for better results in WPScan goto ${UBLUE}modules/wpscan.sh${NC} ${W}and add"
echo -e " '${UBLUE}--api-token ${URED}your-wpscan-api-token${UBLUE}${NC}${W}' argument to both commands"
echo -e "please add your ${YLW}shodan-api key to ${UBLUE}modules/credmods/xray.sh${NC} ${W}by '${URED}SHODAN-API${W}'${NC}"
echo ""
echo -e "${RED}==========================================================================================${NC}"

##################################################################################################################
##########################______________ czFsM250NzggX18gUmFiYjE3J3MgRGVu ______________##########################
##################################################################################################################
