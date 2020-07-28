#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

if [[ -d '/opt/sifter/results/seeker' ]]; then
    sleep 2
else
    mkdir /opt/sifter/results/seeker
fi
echo -e "${ORNG}"
figlet -f mini "Seeker"
echo -e "${NC}"
cd /opt/seeker
echo -e "${W}Please enter the output name of KML file${NC}"
read NAME
echo -e "${W}===========================================================================${NC}"
echo -e "${LP}Starting Seeker Server${NC}"
xterm -e ngrok http 8080
sudo python3 seeker.py --tunnel manual -k ${NAME}
echo -e "${LP}Starting Ngrok Server${NC}"
echo -e "${W}===========================================================================${NC}"
echo -e "${RED}NOTE: ${ORNG}Send the ngrok link with /nearyou/ prepended at the end to target${NC}"
echo -e "${YLW}eg. ifwfhw9w8f.ngrok.io/nearyou/${NC}"
echo -e "${W}===========================================================================${NC}"
sleep 10
cd /opt/sifter
sifter -m

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################