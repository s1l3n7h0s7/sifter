#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
ORNG='\033[0;33m'
W='\033[1;37m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

echo -e "${ORNG}Yuki-Chan${NC}"
echo -e "${ORNG}***********${NC}"
echo -e "${YLW}"
cat files/pingtest.pass
echo -e "${NC}"
echo -e "${W}Please copy and paste in your target site${NC}"
echo "================================================================================================="
cd /root/yuki
sleep 1
sudo ./startyuki
echo "================================================================================================="
cd /opt/sifter
./modules/module.sh
