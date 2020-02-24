#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

echo -e "${ORNG}"
figlet -f mini "aSnip"
echo -e "${NC}"
echo -e "${W}Please enter your target${NC}"
read TARGET
asnip -t ${TARGET} -p
sleep 2
echo "===================================================================="
sleep 2
cd /opt/sifter
./modules/module.sh