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

cd /opt/omega
echo -e "${RED}"
figlet -f mini Omega
echo -e "${NC}"
omega
cd /opt/sifter
sifter -m

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################