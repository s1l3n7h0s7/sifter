#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

cd /opt/PowerHub
echo -e "${ORNG}"
figlet -f mini "PowerHub"
echo -e "${NC}"
echo -e "${W}Please enter your local IP${NC}"
read IP
echo -e "${W}Please enter a login username${NC}"
read USER
echo -e "${W}Please enter a login password${NC}"
read PASS
source env/bin/activate
sleep 2
xterm -e source /opt/PowerHub/env/bin/activate && ./powerhub.py ${IP} --auth ${USER}:${PASS} 
sleep 5
xterm -e firefox https://${IP}:8080
sleep 2
cd /opt/sifter
./sifter -m

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################