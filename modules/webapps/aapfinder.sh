#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'
t_question(){
    echo -e "${YLW}"
    cat targets.txt
    echo -e "${W}Is your target list correct?(y/n)${NC}"
    read TLIST
    t_ans
}
t_ans(){
    if [[ ${TLIST} == 'y' ]]; then
        echo -e "${W}Great! Time to start AapFinder${NC}"
    else
        echo -e "${W}Please enter your target/s when the file opens${NC}"
        sleep 5
        sudo nano targets.txt
        t_question
    fi
}

# AapFinder Start
if [[ -d '/opt/sifter/results/AapFinder' ]]; then
    sleep 2
else
    mkdir /opt/sifter/results/AapFinder
fi
cd /opt/aapfinder
echo -e "${ORNG}"
figlet -f mini "AapFinder"
echo -e "${NC}"
t_question
echo -e "${W}How many seconds would you like to delay before each new login attempt?"
echo -e "${RED}NOTE: ${ORNG}The longer the delay the less chance of detection${NC}"
read DELAY
echo -e "${W}Would you like to try speed up the scan using multithreading?(y/n)${NC}"
read THREADQ
if [[ ${THREADQ} == 'y' ]]; then
    THREAD='-f'
else
    THREAD=''
fi
echo -e "${W}Please enter the type to use (eg. html, php, asp)${NC}"
read TYPE
echo -e "${W}Please enter the name of the output file${NC}"
read OUTPUT
echo -e "${W}===========================================================================${NC}"
sudo python3 aapfinder.py --targets targets.txt -d ${DELAY} ${THREAD} -t ${TYPE} -o /opt/sifter/results/AapFinder/${OUTPUT}.txt
echo -e "${YLW}Results have been saved to /opt/sifter/results/AapFinder/${OUTPUT}.txt${NC}"
echo -e "${W}===========================================================================${NC}"
cd /opt/sifter
sifter -m


##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################