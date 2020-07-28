#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'
second(){
    echo -e "${W}Would you like to try another?${YLW}(y/n)${NC}"
    read ANS
    if [[ ${ANS} == "y" ]]; then
        cipher
    else
        exmods
    fi
}
cipher(){
    echo -e "${W}Please enter the hash you'd like to try crack${NC}"
    read HASH
    dcipher ${HASH}
    second
}

echo -e "${RED}"
figlet DCipheR
echo -e "${NC}"
cipher
cd /opt/sifter
./sifter -m

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################