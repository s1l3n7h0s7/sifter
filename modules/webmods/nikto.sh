#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
ORNG='\033[0;33m'
W='\033[1;37m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
nikto_multi(){
	for name in `cat files/pingtest_pass.txt`
        do
			nikto -host ${TARGET} | tee /opt/sifter/results/Nikto/${TARGET}.txt
		done
}
nikto_single(){
	echo -e "${YLW}"
	cat pingtest_pass.txt
	echo -e "${NC}"
	echo -e "${W}Please enter your target.${NC}"
	read TARGET
	sleep 1
	nikto -host ${TARGET} | tee /opt/sifter/results/Nikto/${TARGET}.txt
}

if [[ -d /opt/sifter/results/Nikto ]]; then
    echo ""
else
    mkdir /opt/sifter/results/Nikto
fi
echo -e "${ORNG}Nikto${NC}"
echo -e "${ORNG}******${NC}"
echo -e "${W}Would you like to run Nikto against a Single target or against your target List?(s/l)${NC}"
read ANS
sleep 1
if [[ ${ANS} == s ]] || [[ ${ANS} == S ]]; then
	nikto_single
else
	nikto_multi
fi
echo "==============================================================================================="
echo -e "${RED}Results have been saved to /opt/sifter/results/Nikto${NC}"
echo "==============================================================================================="
./modules/module.sh
