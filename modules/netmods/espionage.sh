#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

cd /opt/Espionage
echo -e "${RED}"
figlet -f mini "Espionage"
echo -e "${NC}"
echo -e "${W}Please enter the type of scan you'd like to do${NC}"
    echo -e "${ORNG}"
    options=("Network Scan" "ArpSpoof Attack" "Back" "Quit")
        select opt in "${options[@]}"
        do
            case $opt in
                "Network Scan")
                    echo -e "${W}Would you like to enable verbose output?${YLW}(y/n)${NC}"
                    read VER
                    if [[ ${VER} == 'y' ]]; then
                        VERB='--verbose'
                    else
                        VERB='--normal'
                    fi
                    echo -e "${W}Would you like to sniff only http/https connections?"
                    echo -e "${LP}1. ${RED}HTTP${NC}"
                    echo -e "${LP}2. ${RED}HTTPS${NC}"
                    echo -e "${LP}3. ${RED}Both ${NC}"
                    read CON 
                    if [[ ${CON} == '1' ]]; then
                        URL='--onlyhttp'
                    elif [[ ${CON} == '2' ]]; then
                        URL='--onlyhttpsecure'
                    else
                        URL=''
                    fi
                    echo -e "${W}Please enter your network interface to use?"
                    read IFC 
                    echo -e "${W}Would you like to save your output to a file?${YLW}(y/n)${NC}"
                    read OF 
                    if [[ ${OF} == 'y' ]]; then
                        OUT='-f capture_output.pcap'
                    else
                        OUT=''
                    fi
                    sudo python3 espionage.py ${VERB} --httpraw --iface ${IFC} ${OUT} ${URL}
                    ;;

                "ArpSpoof Attack")
                    echo -e "${W}Would you like to sniff all connections or only URLs visited by the victim?"
                    echo ""
                    echo -e "${LP}1. ${RED}all connections${NC}"
                    echo -e "${LP}2. ${RED}Only visited URLs${NC}"
                    read CON 
                    if [[ ${CON} == '1' ]]; then
                        URL=''
                    else
                        URL='--urlonly'
                    fi
                    echo -e "${W}Please enter your network interface to use?"
                    read IFC 
                    echo -e "${W}Please enter the target IP address"
                    read TARGET
                    sudo python3 espionage.py --target ${TARGET} --iface ${IFC} ${URL}
                    ;;

                "Back")
                    cd /opt/sifter
                    ./sifter -m
                    ;;

                "Quit")
                    exit
                    ;;

            esac
        done
    echo -e "${NC}"


##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################