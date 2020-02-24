#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

if [[ -d '/opt/TigerShark' ]]; then
	cd /opt/TigerShark
	echo -e "${ORNG}"
	figlet -f mini "TigerShark"
	echo -e "${NC}"
	./tigershark
else
	echo -e "${W}This is your first time using the TigerShark module. \n TigerShark is a multi-tooled Phishing Framework"
	echo -e "This tool will need to be installed, is this okay?(y/n)${NC}"
	read TSQ
	if [[ ${TSQ} == 'y' ]]; then
		cd /opt
		sudo git clone https://github.com/s1l3nt78/TigerShark.git
		sudo chown $USER:$USER -R TigerShark
		cd TigerShark
		chmod +x install.sh
		sudo ./install.sh
		echo -e "${YLW}TigerShark is installed${NC}"
		sleep 5
		./tigershark
	else
		cd /opt/sifter
		./modules/module.sh
	fi
fi 
