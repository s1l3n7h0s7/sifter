#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
ORNG='\033[0;33m'
W='\033[1;37m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
listing(){
    echo -e "${YLW}"
    cat files/pingtest.pass
    echo -e "${NC}"
}

if [[ -d /opt/sifter/results/Sublist3r ]]; then
    echo ""
else
    mkdir /opt/sifter/results/Sublist3r
fi
echo -e "${ORNG}Sublist3r"
echo -e "*********${NC}"
listing
echo -e "${W}Please enter your target.${NC}"
read TARGET
sleep 1
cd /opt/Sublist3r
python sublist3r.py -d ${TARGET} -b -v -t 8 -o /opt/sifter/results/Sublist3r
./modules/module.sh