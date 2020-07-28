#!/bin/bash
LPATH='/opt/sifter/'
ORNG='\033[0;33m'
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
INJP=''
DATA=''
LVL='2'
PAY='--params'
TNUM='1'
TOUT='7'
BLIND=''
FUZZ=''

echo -e "${ORNG}"
figlet XSStrikE
echo -e "${NC}"
cd /opt/XSStrike 
# Target Options (methods)
echo -e "${YLW}Target Examples:"
echo -e "${LP}Target (with payload injection):\n${UBLUE}http://example.com/search/form/query ${NC}"
echo ""
echo -e "${LP}Target (without payload injection):\n${URED}http://example.com/search.php?q=query${NC}\n${URED}'http://example.com/search.php' --data 'q=query'${NC}"
echo ""
echo -e "${W}Would you like to test the target URL using a ${YLW}G${W}ET, ${YLW}P${W}OST method or using payload ${YLW}i${W}njection?(${YLW}g${W}/${YLW}p${W}/${YLW}i${W})${NC}"
read THOD
if [[ ${THOD} == 'g' ]]; then
    echo -e "${W}Please enter the target URL${NC}"
    echo -e "${RED}eg. ${YLW}http://example.com/search.php?q=query ${NC}"
    read TARGET
    echo -e "${W}Would you like to use blind xss injection?${NC}"
    read BQ
    if [[ ${BQ} == 'y' ]]; then
        BLIND='--blind'
    fi
elif [[ ${THOD} == 'i' ]]; then
    echo -e "${W}Please enter the target URL${NC}"
    echo -e "${RED}eg. ${YLW}http://example.com/search/form/query ${NC}"
    read TARGET
    INJP='--path'
else
    echo -e "${W}Please enter the target URL${NC}"
    echo -e "${RED}eg. ${YLW}http://example.com/search.php\n${ORNG}The POST data is supplied seperately ${YLW}(using a '--data' argument)${NC}"
    read TARGET
    echo -e "${W}Would you like to treat JSON data via post method?(${YLW}y${W}/${YLW}n${W})"
    read JS 
    if [[ ${JS} == 'y' ]]; then 
        echo -e "${W}Please enter the POST data in the example format${NC}"
        echo -e "${YLW}eg. ${W}{\"q\":\"query\"}${NC}"
        read DAT
        DATA='--data ${DAT} --json'
    else
        echo -e "${W}Please enter the POST data in the example format${NC}"
        read DATA
    fi
    echo -e "${W}Would you like to use blind xss injection?${NC}"
    read BQ
    if [[ ${BQ} == 'y' ]]; then
        BLIND='--blind'
    fi
fi    
# Crawling Levels
echo -e "${W}How many levels would you like to crawl?${NC}"
read LVL
CRAWL='--crawl -l ${LVL}'
# URL Seeding
echo -e "${W}Would you like to add seeds for crawling?(${YLW}y${W}/${YLW}n${W})"
read SEED
if [[ ${SEED} == 'y' ]]; then
    echo -e "${W}Please enter the full path/to/seeds.txt${NC}"
    read SEEDS 
    SFILE='--seeds ${SEEDS}'
else
    SFILE=''
fi
# Customized Payload File
echo -e "${W}Would you like to test payloads from a ${YLW}c${W}ustomized file or XSStrike ${YLW}d${W}efaults?(${YLW}c${W}/${YLW}d${W})${NC}"
read PQ
if [[ ${PQ} == 'c' ]]; then
    echo -e "${W}Please enter the full path/to/file.txt${NC}"
    read FILE
    PAY='--file ${FILE}'
fi
# Threads
echo -e "${W}Please enter the number of concurrent threads to use for scanning or hit enter for default (${RED}1${W})\n${YLW}Please note that this will speed up scanning, but may trigger security mechnisms${NC}"
read TNUM
# Timeout
echo -e "${W}Please enter the number of seconds, before XSStrike should consider the request timed out. Otherwise hit enter for default (${RED}7${W})${NC}"
read TOUT
# Headers
echo -e "${W}Would you like to use custom headers? (${YLW}y${W}/${YLW}n${W}"
read HQ
if [[ ${HQ} == 'y' ]]; then
    HEAD='--headers'
else
    HEAD=''
fi
# Fuzzer
echo -e "${W}Would you like to use the fuzzing option?(${YLW}y${W}/${YLW}n${W})"
read FQ
if [[ ${FQ} == 'y' ]]; then
    FUZZ='--fuzzer -d 2'
fi

# Runtime Variables
echo -e "${ORNG}XSStrike using the following variable:${NC}"
echo -e "${RED}**************************************${NC}"
echo -e "${W}Target		: ${RED} $TARGET ${NC}"
if [[ ${THOD} == 'p' ]]; then
    echo -e "${W}Data           : ${RED} ${DATA} ${NC}"
fi
if [[ ${THOD} == 'i' ]]; then
    echo -e "${W}Inject URL Path: ${RED} Yes ${NC}"
else
    echo -e "${W}Inject URL Path: ${RED} No ${NC}"
fi
echo -e "${W}Crawler Level	: ${RED} ${LVL} ${NC}"
if [[ ${SEED} == 'y' ]]; then
    echo -e "${W}Seed File      : ${RED} ${SEEDS} ${NC}"
fi
if [[ ${PQ} == 'c' ]]; then
    echo -e "${W}Payload File   : ${RED} ${FILE} ${NC}"
else
    echo -e "${W}Payloads       : ${RED} Default XSStrike payloads${NC}"
fi
echo -e "${W}Runtime Threads: ${RED} ${TNUM} ${NC}"
echo -e "${W}Timeout (sec)  : ${RED} ${TOUT} ${NC}"
if [[ ${HQ} == 'y' ]]; then
    echo -e "${W}Custom Headers : ${RED} Yes ${NC}"
else
    echo -e "${W}Custom Headers : ${RED} No ${NC}"
fi
if [[ ${BQ} == 'y' ]]; then
    echo -e "${W}BlindXSS       : ${RED} Yes ${NC}"
else
    echo -e "${W}BlindXSS       : ${RED} No ${NC}"
fi
if [[ ${FQ} == 'y' ]]; then
    echo -e "${W}Fuzzing        : ${RED} Yes ${NC}"
else
    echo -e "${W}Fuzzing        : ${RED} No ${NC}"
fi
echo "Please wait...."

# Execution Runtime
sudo python3 xsstrike.py -u ${TARGET} ${DATA} ${INJP} --crawl -l ${LVL} ${SFILE} ${PAY} ${FILE} --threads ${TNUM} --timeout ${TOUT} ${HEAD} ${FUZZ}

sleep 5
cd /opt/sifter
./sifter -m

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################