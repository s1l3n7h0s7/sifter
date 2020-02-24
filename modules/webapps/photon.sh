#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
listing(){
    echo -e "${YLW}"
    cat files/pingtest.pass
    echo -e "${NC}"
}
single_target(){
    listing
    echo -e "${W}Please enter your target${NC}"
    read TARGET
    if [[ -d /opt/sifter/results/Photon/${TARGET} ]]; then
        echo ""
    else
        mkdir /opt/sifter/results/Photon/${TARGET}
    fi
    echo -e "${W}How many levels would you like to crawl?: ${NC}"
    read LEVEL
    echo -e "${W}How many threads would you like to run?: ${NC}"
    read THREADS
    sleep 1
    python3 /opt/Photon/photon.py -u ${TARGET} -l ${LEVEL} -t ${THREADS} -v --dns --keys -o /opt/sifter/results/Photon/${TARGET}
}
multi_target(){
    for name in `cat files/pingtest.pass`
        do
            echo -e "${W}How many levels would you like to crawl of each url?: ${NC}"
            read LEVEL
            echo -e "${W}How many threads would you like to run?: ${NC}"
            read THREADS
            sleep 1
            if [[ -d /opt/sifter/results/Photon/${name} ]]; then
                echo ""
            else
                mkdir /opt/sifter/results/Photon/${name}
            fi
            python3 /opt/Photon/photon.py -u ${name} -l ${LEVEL} -t ${THREADS} -v --dns --keys -o /opt/sifter/results/Photon/${name}
        done
}

echo -e "${ORNG}Photon"
echo -e "*******${NC}"
if [[ -d /opt/sifter/results/Photon ]]; then
    echo ""
else
    mkdir /opt/sifter/results/Photon
fi

listing
echo -e "${W}Would you like to run Photon against a single target or the target list?(s/l)${NC}"
read ANS
sleep 1
if [[ ${ANS} == s ]]; then
    single_target
else
    multi_target
fi
echo "==============================================================================================================a"
./modules/module.sh
