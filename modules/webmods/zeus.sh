#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
ORNG='\033[0;33m'
W='\033[1;37m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

echo -e "${RED}"
figlet -f mini ZeuS
echo -e "${NC}"
sudo docker exec -i zeus python zeus.py
echo -e "${W}Please enter the command and args for zeus to run${NC}"
echo -e "${YLW}eg. -t http://target.com -s --verbose${NC}"
read ARGS
sudo docker exec -i zeus ${ARGS}
cd /opt/sifter
sifter -m

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################