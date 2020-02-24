#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
ORNG='\033[0;33m'
W='\033[1;37m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

if [[ -d /opt/sifter/results/DomFuzz ]]; then
    echo ""
else
    mkdir /opt/sifter/results/DomFuzz
fi
figlet -f mini "DomainFuzz"
cd /opt/DomainFuzz
echo -e "${YLW}"
cat /opt/sifter/files/pingtest.pass
echo -e "${NC}"

echo "============================================================================"

echo -e "${W}Please enter your target site${NC}"
sleep 1
read TARGET
sleep 1

echo "============================================================================"

echo -e "${W}Would you like json or csv format for output${NC}"
sleep 1
read FORMAT
sleep 1

echo "============================================================================"

echo -e "${W}Please enter the name of your output file${NC}"
sleep 1
read DOC
sleep 1

echo "============================================================================"

echo -e "${W}How many thread would you like to run?${RED}(Default 10)${NC}"
sleep 1
read REPLY
if [[ $REPLY == '' ]]; then
	THREADS='10'
else
	THREADS=$REPLY
fi
sleep 1

echo "============================================================================"

echo -e "${W}Would you like to add custom nameservers to query?(y/n)${NC}"
read CNS
if [[ ${CNS} == y ]];then
	echo -e "${W}Please enter nameservers to query separated by a comma${NC}"
	sleep 1
	read NS
else
	NS='8.8.8.8,8.8.4.4'
fi

echo "============================================================================"

echo -e "${W}Would you like to use a dictionary file for additional domain name generation?(y/n)${NC}"
read DA
if [[ ${DA} == y ]]; then
	ls dictionaries
	echo -e "${W}Please choose which file to use${RED} or enter path to custom file${NC}"
	read DICT
	sleep 1
else
	echo -e "${W}Okay.${NC}"
fi

echo "============================================================================"

				echo -e "${ORNG}Running DomainFuzz Using:${NC}"
				echo "*************************************************"
				echo -e "${W}Target		: ${RED} ${TARGET} ${NC}"
				echo -e "${W}Output File	: ${RED} ${DOC} ${NC}"
				echo -e "${W}Format		: ${RED} ${FORMAT} ${NC}"
				echo -e "${W}Dictionary File : ${RED} ${DICT} ${NC}"
				echo -e "${W}Threads	 : ${RED} ${THREADS} ${NC}"
				echo -e "${W}Nameservers	: ${RED} ${NS} ${NC}"
				echo -e "${LP}Please wait....${NC}"
				node cli.js --target ${TARGET} --format ${FORMAT} --out-put ${DOC} -c ${THREADS} --nameservers ${NS} --modules whois,banners,mxcheck,geoip,ssdeep

./modules/module.sh
