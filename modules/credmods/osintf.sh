#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

cd /opt/OSINT-Framework
echo -e "${RED}"
figlet -f mini "OSINT-Framework"
echo -e "${NC}"
xterm -e sudo python3 -m http.server 9999
sleep 30 
echo -e "	============================================"
cd /opt/sifter
./sifter -m

##########################______________ czFsM250NzggX18gUmFiYjE3J3MgRGVu ______________##########################