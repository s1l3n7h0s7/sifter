#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
ORNG='\033[0;33m'
W='\033[1;37m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
multi_scan(){
    for name in `cat files/pingtest.pass`
        do
            echo -e "${W}How long would you like theHarvester to run for?(seconds)${NC}"
            read TIME
            sleep 1
            theHarvester -d ${name} -S ${TIME} -s -e 8.8.8.8 -n -c -b google -f /opt/sifter/results/results_${name}.html
            echo -e "${RED}Results saved to /opt/sifter/results/Harvester/results_${name}.html${NC}"
        done
}
single_scan(){
    echo -e "${YLW}"
    cat files/pingtest.pass
    echo -e "${NC}"
    echo -e "${W}Please enter your target${NC}"
    read TARGET
    echo -e "${W}How long would you like theHarvester to run for?(seconds)${NC}"
    read TIME
    sleep 1
    theHarvester -d ${TARGET} -S ${TIME} -s -e 8.8.8.8 -n -c -b google -f /opt/sifter/results/results_${name}.html
    echo -e "${RED}Results saved to /opt/sifter/results/Harvester/results_${TARGET}.html${NC}"
}

echo -e "${ORNG}theHarvester${NC}"
echo -e "${ORNG}*************${NC}"
echo -e "${YLW}"
cat files/pingtest.pass
echo -e "${NC}"
echo -e "${W}Would you like to use a single target or the whole list?(s/l)${NC}"
read ANS
sleep 1
if [[ ${ANS} == s ]]; then
    single_scan
else
    multi_scan
fi
./modules/module.sh
