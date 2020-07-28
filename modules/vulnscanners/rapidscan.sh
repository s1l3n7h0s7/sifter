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
listing(){
    echo -e "${YLW}"
    cat files/pingtest.pass
    echo -e "${NC}"
}

if [[ -d /opt/sifter/results/Rapidscan ]]; then
    echo ""
else
    mkdir /opt/sifter/results/Rapidscan
fi
echo -e "${RED}"
figlet -f mini "RapidscaN"
echo -e "${NC}"
echo -e "${YLW}Note: This module can take a while (30+ mins),"
echo -e "and will be run in the background. Feel free to keep using the tool.${NC}"
echo -e "${RED}*${YLW}You can goto ${LP}Pass Time${YLW} in the module menu to kill some time while you wait${NC}"
listing
sleep 1
echo "==================================================================================="
xterm -e sudo rapidscan &
echo -e "${W}When ready hit enter${NC}"
cd /opt/sifter
sifter -m


##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################