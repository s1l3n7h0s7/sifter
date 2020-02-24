#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'
CONF='/opt/Sitadel/config.yml'
# Configuration Variables
fp_mod_select(){
	echo -e "${LP}FINGERPRINT	${YLW}MODULE DESCRIPTION${NC}"
	echo -e "${LP}cdn	${YLW}Try to guess if the target uses Content Delivery Network (fastly, akamai,cloudflare...)"
	echo -e "${LP}cms	${YLW}Try to guess if the target uses a Content Management System (drupal,wordpress,magento...)"
	echo -e "${LP}framework	${YLW}Try to guess if the target uses a backend framework (cakephp, rails, symfony...)"
	echo -e "${LP}frontend	${YLW}Try to guess if the target uses a frontend framework (angularjs, jquery, vuejs...)"
	echo -e "${LP}header	${YLW}Inspect the headers exchanged with the target"
	echo -e "${LP}lang	${YLW}Try to guess the server language used by the target (asp, python, php...)"
	echo -e "${LP}server	${YLW}Try to guess the server technology used by the target (nginx,apache...)"
	echo -e "${LP}system	${YLW}Try to guess the Operation System used by the target (linux,windows...)"
	echo -e "${LP}waf	${YLW}Try to guess if the target uses a Web Application Firewall (barracuda, bigip,paloalto...)"
	echo -e "${W}Please enter the name of the fingerprint module you'd like to use${NC}"
	read FP_MODULE
}
atk_mod_select(){
	echo -e "${LP}ATTACK	${YLW}MODULE DESCRIPTION${NC}"
	echo -e "${LP}bruteforce	${YLW}Try to bruteforce the location of multiple files (backup files, admin consoles...)${NC}"
	echo -e "${LP}injection	${YLW}Try to perform injection on various language (SQL,html,ldap, javascript...)${NC}"
	echo -e "${LP}vulns	${YLW}Try to test for some known vulnerabilities (crime,shellshock)${NC}"
	echo -e "${LP}other	${YLW}Try to probe for various interesting resources (DAV, htmlobjects,phpinfo,robots.txt...)${NC}"
	echo -e "${W}Please enter the name of the attack module you'd like to use${NC}"
	read ATK_MODULE
}
risk_lvl(){
	echo -e "${W}Please enter the risk level you'd like to use(0,1,2)"
	echo -e "${RED}Note:${LP}The higher the level of risk, the more likely the scans will be detected."
	echo -e "Some scans won't be run on lower levels${NC}"
	read RISKLVL
}
302_redir(){
	echo -e "${W}If the site contains 302 redirects, would you like to follow them?(y/n)${NC}"
	read FRED
	if [[ ${FRED} == "y" ]]; then
		FREDIR='--redirect'
	else
		FREDIR='--no-redirect'
	fi 
}
timeout(){
	echo -e "${W}Please specify the timeout for HTTP requests${NC}"
	read TIMO
}
use_cookie(){
	echo -e "${W}Would you like to specify a cookie to use?(y/n)"
	echo -e "${RED}Note:${LP}You need to obtain this yourself${NC}"
	read COOKIEQ
	if [[ ${COOKIEQ} == "y" ]]; then
		echo -e "${W}Please enter the cookie you'd like to use${NC}"
		read COOKIE
		UC='--cookie'
	else
		echo -e "${YLW}DOH! Looks like homer ran out of donuts, and ate all the cookies too.. :'(${NC}"
		COOKIE=''
		UC=''
	fi
}
config(){
	
	echo -e "${W}Please specify the config file to use, otherwise just hit enter to use default(/opt/Sitadel/config/config.yml)"
	read CONF1
	if [[ ${CONF1} == '' ]];then
		CONF='/opt/Sitadel/config/config.yml'
	fi
}
verbose(){
	echo -e "${W}Please enter the level of verbosity to use(0,1,2,3)"
	echo -e "${W}Default is 1${NC}"
	read VERBOS
	if [[ ${VERBOS} == "0" ]]; then
		VERB=''
	elif [[ ${VERBOS} == "1" ]]; then
		VERB='-v'
	elif [[ ${VERBOS} == "2" ]]; then
		VERB='-vv'
	elif [[ ${VERBOS} == "3" ]]; then
		VERB='-vvv'
	else
		VERB='-v'
	fi
}

# Start of Sitadel Script
echo -e "${ORNG}"
figlet -f mini "Sitadel"
echo -e "${NC}"
cd /opt/Sitadel
fp_mod_select
atk_mod_select
risk_lvl
302_redir
timeout
use_cookieCONF='/opt/Sitadel/config.yml'
config
verbose
echo -e "$CONF='/opt/Sitadel/config.yml'${NC}"
echo -e "${LP}eg. http://example.com"
read TARGET
echo "=============================================================================================================="
sudo python3 sitadel.py -r ${RISKLVL} ${FREDIR} -t ${TIMO} ${UC} ${COOKIE} -f ${FP_MODULE} -a ${ATK_MODULE} --config $CONF ${VERB} ${TARGET}
echo "=============================================================================================================="
sleep 2
cd /opt/sifter
./modules/module.sh