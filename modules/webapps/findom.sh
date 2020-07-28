#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'
if [[ ! -d '/opt/sifter/results/finDOM' ]]; then
	sudo mkdir /opt/sifter/results/finDOM
fi

echo -e "${RED}"
figlet -f mini "finDOM-XSS"
echo -e "${NC}"
cd /opt/findom-xss
echo -e "${W}Would you like to use a ${YLW}s${W}ingle target or a ${YLW}l${W}ist?(${YLW}s${W}/${YLW}l${W})${NC}"
read TAR 
if [[ ${TAR} == "s" ]]; then
	echo -e "${RED}Target Example:${YLW} https://target.host/about-us.html ${NC}"
	read TARGET
	sudo ./findom-xss.sh ${TARGET} /opt/sifter/results/finDOM
else
	echo -e "${YLW}Please enter the full path/to/urls.txt${NC}"
	echo -e "${RED}Target Example:${YLW} https://target.host/about-us.html \n${LP}Please ensure URL's in list are as above${NC}"
	read LIST
	sudo cp ${LIST} -t /opt/sifter/results/finDOM/temp.txt
	cat /opt/sifter/results/finDOM/temp.txt | sudo ./findom-xss.sh 
fi
sleep 2
echo -e "${W}======================================================${NC}"
sleep 2
cd /opt/sifter
sifter -m

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################