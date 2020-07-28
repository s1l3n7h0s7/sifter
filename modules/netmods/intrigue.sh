#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
ORNG='\033[0;33m'
W='\033[1;37m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

echo -e "${ORNG}"
figlet -f small "Intrigue"
echo -e "${NC}"
cd /opt/intrigue-core
sleep 2
echo -e "${YLW}Throwing up Intrigue Server at ${LBBLUE}http://127.0.0.1:7777${NC}"
sleep 1
echo -e "${URED}Panel Login Info:${ORNG}"
cat /opt/Intrigue-Core/Panel_Login.info
echo -e "${NC}"
xterm -e sleep 20 && firefox http://127.0.0.1:7777 &
sleep 5
echo -e "${W}Would you like your data to persist through sessions?${YLW}(y/n)${NC}"
read PER
if [[ ${PER} == "y" ]]; then
	sudo docker run -e LANG=C.UTF-8 -v ~/intrigue-core-data:/data -p 0.0.0.0:7777:7777 -it intrigue-core
else
	sudo docker run -e LANG=C.UTF-8 ~/intrigue-core-data:/data -p 0.0.0.0:7777:7777 -it intrigue-core
fi
sleep 2
cd /opt/sifter
./sifter -m

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################
