#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
ORNG='\033[0;33m'
W='\033[1;37m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

if [[ -d /opt/sifter/results/ASM ]]; then
    echo ""
else
    sudo mkdir /opt/sifter/results/ASM
fi
echo -e "${RED}"
figlet -f mini "AttackSurfaceMapper"
cd /opt/AttackSurfaceMapper
echo -e "${RED}Checking if chromedriver is in envpath${NC}"
if [[ -f /usr/bin/chromedriver ]]; then
	echo -e "${W}Everything is good${NC}"
else
	echo -e "${LP}Getting chromedriver${NC}"
	sudo wget https://chromedriver.storage.googleapis.com/81.0.4044.69/chromedriver_linux64.zip
	sudo unzip chromedriver_linux64.zip
	sudo mv chromedriver -t /usr/bin
	sudo chown $USER:$USER /usr/bin/chromedriver
fi
echo -e "${YLW}"
cat /opt/sifter/files/pingtest.pass
echo -e "${NC}"
cd /opt/AttackSurfaceMapper
echo -e "${LP}Activate Python Virtual Environment for Runtime${NC}"
source venv/bin/activate
echo "============================================================================"
echo -e "${W}Please enter your target site${NC}"
sleep 1
read TARGET
sleep 1
echo "============================================================================"
ls resources
echo -e "${W}Please enter list to use for subdomain scanning${NC}"
echo -e "${URED}NOTE:${ORNG} Lists shown above are in resources folder\nTo use these lists, please first type ${UBLUE}resources${NC}${ORNG}\nThis is to allow tab completion for custom lists${NC}"
sleep 1
read -e -p "" LIST
sleep 1
echo "============================================================================"
echo -e "${W}Please enter name to use for output file${NC}"
sleep 1
read DOC
sleep 1
echo "============================================================================"
echo -e "${W}Would you like txt or csv format for output${NC}"
sleep 1
read FORMAT
sleep 1
echo "============================================================================"
echo -e "${W}Would you like to enable screen capture?(y/n)${NC}"
sleep 1
read SC1
if [[ ${SC1} == y ]];then
	SC='-sc'
else
		SC=''
fi
echo "============================================================================"
echo -e "${W}Would you like to run the scan in Stealth mode${NC}"
echo -e "${ORNG}Please note this means only OSINT techniques will be used(y/n) \n Disabled by default${NC}"
sleep 1
read STLTH1
sleep 1
if [[ ${STLTH1} == y ]]; then
	STLTH='--stealth'
else
	STLTH=''
fi
echo "============================================================================"
echo -e "${W}Would you like to run AttackSurfaceMapper in Debug mode?(${YLW}y/n${W})\n${YLW}This allows you to see runtime output in order to verify ASM is running correctly.${NC}"
read DEB 
if [[ ${DEB} == "y" ]]; then
	DE='yes'
	BUG='-d'
else
	DE='no'
	BUG=''
fi
echo "============================================================================"
echo -e "${ORNG}Running Attack Surface Mapper Using:${NC}"
echo "*************************************************"
echo -e "${W}Target		: ${RED} $TARGET ${NC}"
echo -e "${W}Subdomain list	: ${RED} $LIST ${NC}"
echo -e "${W}Output File	: ${RED} $DOC ${NC}"
echo -e "${W}Format		: ${RED} $FORMAT ${NC}"
echo -e "${W}Screen Capture	: ${RED} $SC1 ${NC}"
echo -e "${W}Stealth		: ${RED} $STLTH1 ${NC}"
echo -e "${W}Debug			: ${RED} ${DE} ${NC}"
echo "Please wait...."
sudo ./venv/bin/python3 asm.py -t ${TARGET} -ln -w resources/${LIST} -o /opt/sifter/results/ASM/${DOC} -f ${FORMAT} ${SC} ${STLTH} ${BUG} -v
cd /opt/sifter
sifter -m


##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################
