#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

if [[ -d "/opt/sifter/results/aSnip" ]]; then
	sleep 1
else 
	mkdir /opt/sifter/results/aSnip
fi
echo -e "${RED}"
figlet -f mini "aSnip"
echo -e "${NC}"
echo -e "${W}Please enter your target${NC}"
read TARGET
mkdir /opt/sifter/results/aSnip/${TARGET}
cd /opt/sifter/results/aSnip/${TARGET}
asnip -t ${TARGET} -p
sleep 2
echo "===================================================================="
sleep 2
cd /opt/sifter
sifter -m

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################