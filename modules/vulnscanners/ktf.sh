#!/bin/bash
RED='\033[0;31m'
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
UBLUE='\033[4;34m'
URED='\033[4;31m'
KD=$(kdialog -h)
if [[ ${KD} == "" ]]; then
    XT=$(xterm -h)
    if [[ ${XT} == "" ]]; then
        COM='cat'
    else
        COM='xterm -e'
    fi
else
    COM='kdialog --geometry 600x800 --textbox'
fi 
echo -e "${ORNG}"
figlet -f small "KatanaFramework"
echo -e "${NC}"
cd /opt/KatanaFramework
echo -e "${RED}NOTE: ${YLW}A small command example list will be provided to give you an idea\nof how to run Katana. If you still have trouble follow this link\n${ORNG}https://github.com/PowerScript/KatanaFramework/wiki/How-to-use${NC}"
sleep 2
echo -e "\n${LP}"
${COM} /opt/sifter/info/ktf_com.md
echo ""
sleep 5
sudo java -jar ktf.gui.jar
cd /opt/sifter
./sifter -m

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################