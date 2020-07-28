#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

cd /apps/NevrrMore
echo -e "${ORNG}"
figlet -f mini "NevrrMore"
echo -e "${NC}"
sudo ./NevrrMore
sleep 2
cd /opt/sifter
sifter -m

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################