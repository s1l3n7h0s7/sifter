#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

cd /opt/SniffingBear
echo -e "${ORNG}"
figlet -f mini "SniffingBear"
echo -e "${NC}"
echo -e "${LP}SniffingBear is a HoneyPot Detection System${NC}"
sleep 5
cd Server
echo -e "${YLW}Starting SniffingBear Server${NC}"
xterm sudo python server.py 12345
cd ../Worker
echo -e "${YLW}Starting SniffingBear Worker${NC}"
xterm sudo python worker.py 12344
cd ../Client
echo -e "${YLW}Starting SniffingBear Client${NC}"
sudo python Client.py
sleep 10
cd /opt/sifter
./modules/module.sh
