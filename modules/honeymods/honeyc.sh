#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

cd /opt/HoneyCaught
echo -e "${ORNG}"
figlet -f mini "HoneyCaught"
echo -e "${NC}"
echo -e "${LP}HoneyCaught is a HoneyPot Detection System${NC}"
sleep 5
echo "============================================================================"
python HoneyCaught.py -l
echo "============================================================================"
echo -e "${W}Please enter the host/url to scan${NC}"
read HOST
echo -e "${W}Please enter the port the HoneyPot is running, hit enter to use default (80)${NC}"
read PORT
echo -e "${W}Please enter the module you would like to use${NC}"
read MODULE
echo "============================================================================"
sudo python HoneyCaught.py -u ${HOST} -p ${PORT} -m ${MODULE}
sleep 5
cd /opt/sifter
./sifter -m

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################