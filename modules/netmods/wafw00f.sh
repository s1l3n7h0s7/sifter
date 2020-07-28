#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

waf_list(){
	wafw00f --list
}
if [[ -d '/opt/sifter/results/w00f' ]]; then
	sleep 1
else
	mkdir /opt/sifter/results/w00f
fi
echo -e "${ORNG}"
figlet -f mini Wafw00f
echo -e "${NC}"
echo -e "${W}Wafw00f is able to detect these WAFs${ORNG}"
waf_list
echo -e "${W}Would you like to test for one specific WAF or scan for all?(o/a)"
read OPT
if [[ ${OPT} == "a" ]]; then
	WAF_T='--findall'
else
	waf_list
	echo -e "${W}Please enter the WAF to test for?${NC}"
	read WAF_O
	WAF_T='-t ${WAF_O}'
fi
echo -e "${W}Would you like to follow 3xx redirects or not?(y/n)"
read R3PLY
if [[ ${R3PLY} == "y" ]]; then
	XREDIR='-r'
else
	XREDIR='--noredirect'
fi
echo -e "${W}Would you like to use a proxy for the scan?(y/n)${NC}"
read PROXYO
if [[ ${PROXYO} == "y" ]]; then
	echo -e "${W}Please enter your proxy${RED}"
	echo -e "eg. http://hostname:8080, socks5://hostname:1080 or http://user:pass@hostname:8080 ${NC}"
	read PROXY
	CPROXY='-p ${PROXY}'
else
	echo -e "${W}Not using a proxy for the scan${NC}"
	CPROXY=''
fi
echo -e "${W}Would you like to give a single target or use a list?"
echo -e "list can be in csv, json or txt(s/l)${NC}"
read TARGETO
if [[ ${TARGETO} == "s" ]]; then
	echo -e "${W}Please enter your target (without webmask/ 'http://' protocol)${NC}"
	read TARGET
else
	echo -e "${W}Please enter the full/path/to/targetlist${NC}"
	read TARGETP
	TARGET='-i ${TARGETP}'
fi
sudo wafw00f ${WAF_T} ${XREDIR} ${CPROXY} ${TARGET} >> /opt/sifter/results/w00f/${TARGET}.txt
echo -e "${W}Results saved to /opt/sifter/results/w00f${NC}"
sleep 5
cd /opt/sifter
sifter -m

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################