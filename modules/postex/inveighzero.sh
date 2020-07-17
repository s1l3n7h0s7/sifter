#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

echo -e "${RED}"
figlet -f mini "InveighZero"
echo -e "${NC}"
echo -e "${ORNG}InveighZero should be used on a target system with limited privileges${NC}"
cp /opt/sifter/modules/postex/Inveigh.exe -t /home/$USER/Desktop
echo -e "${UBLUE}Inveigh.exe${NC} ${W}has been moved to /home/$USER/Desktop\nPlease upload it to target machine for usage (Through exploited meterpreter session)${NC}"
echo -e "${W}Once that is done, please hit ${YLW}enter${NC}"
read RANDOM
echo -e "${ORNG}A window will open with inveigh usage options${NC}"
KD=$(kdialog -h)
if [[ ${KD} == "" ]]; then
    COM='cat'
else
    COM='kdialog --geometry 600x800 --textbox'
fi
${COM} /opt/sifter/info/IZUsage.info
sleep 3
cd /opt/sifter
python3 /opt/sfter/extras/ban.py
./sifter -m

##########################______________ czFsM250NzggX18gUmFiYjE3J3MgRGVu ______________##########################
