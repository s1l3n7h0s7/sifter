#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

if [[ -d '/opt/sifter/resuls/OneFind' ]]; then
	sleep 2
else
	mkdir /opt/sifter/results/OneFind
fi
cd /opt/onedrive_user_enum
echo -e "${RED}"
figlet -f mini "OneFind"
echo -e "${ORNG}This tool is used to enumarate OneDrive Users${NC}"
sleep 3
echo -e "${W}Would you like to search for a single user or use a user list?(s/l)${NC}"
read UANS
if [[ ${UANS} == "s" ]]; then
	TARG='-u'
	echo -e "${W}Please enter the target user${NC}"
	read TARGET
else
	TARG='-U'
	echo -e "${W}Please enter the full path/to/users.txt${NC}"
	read TARGET
fi
echo -e "${W}Please enter the domain to enumerate against${NC}"
read DOMAIN
python onedrive_enum.py ${TARGET} -d ${DOMAIN} -o /opt/sifter/results/OneFind/${TARGET}_enum.log
echo "==============================================================================================="
cd /opt/sifter
./sifter -m

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################