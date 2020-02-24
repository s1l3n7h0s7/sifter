#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
ORNG='\033[0;33m'
W='\033[1;37m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
word_list_q(){
    echo -e "${W}Would you like to use a custom wordlist?(y/n): ${NC}"
    read WLISTA
    if [[ ${WLISTA} == "y" ]]; then
        WLISTA='-w'
        echo -e "${W}Please enter the full/path/to/wordlist${NC}"
        read WLISTD
    else
        WLISTA='-w'
        WLISTD='/opt/Konan/db/dict.txt'
        echo -e "${W}Using default wordlist${NC}"
    fi
}
extention_q(){
    echo -e "${W}Would you like to use multiple custom extentions?(y/n)${NC}"
    read CEXTQ
    if [[ ${CEXTQ} == "y" ]]; then
        CEXTQ='-e'
        echo -e "${W}Please enter extentions separated with a comma"
        echo -e "${RED}eg. html,php,csv${NC}"
        read EXT_RT
        FRC='-f'
    else
        CEXTQ=''
        EXT_RT=''
        FRC=''
        echo -e "${W}Using default extentions${NC}"
    fi
}
ext_exclu(){
    echo -e "${W}Would you like to exclude certain status codes (400,401,403,500) from results?(y/n)${NC}"
    read EXTA
    if [[ ${EXTA} == "y" ]]; then
        EXTA='-x'
        echo -e "${W}Please enter status codes to exclude separated by a comma${NC}"
        read ST_EXCL
    else
        EXTA=''
        ST_EXCL=''
        echo -e "${W}Not excluding any status codes from results${NC}"
    fi
}
word_list_split(){
    echo -e "${W}Would you like to enable wordsplitting in wordlist [test.php -> to -> test]?(y/n)${NC}"
    read WLSQ
    if [[ ${WLSQ} == "y" ]]; then
        WLSA='--split'
    else
        WLSA=''
    fi
}
recursive_dir(){
    echo -e "${W}Would you like to run recursively though found & provided directories?(y/n)"
    read RDQ
    if [[ ${RDQ} == "y" ]]; then
        RDA='--recursive --dir-rec'
        echo -e "${W}Please enter provided directories"
        echo -e "eg. admin,test,dev,secret${NC}"
        read DIRECTS
    else
        RDA=''
        DIRECTS=''
        echo -e "${W}Not running recursively${NC}"
    fi
}
brute_force(){
    echo -e "${W}Would you like to brute force sub-directories?(y/n)${NC}"
    read BF_SUBQ
    if [[ ${BF_SUBQ} == "y" ]]; then
        BF_SUBQ='--sub-dir'
        echo -e "${W}Please enter sub-directories to brute force"
        echo -e "eg. admin,test,dev,secret${NC}"
        read BF_SUB
    else
        BF_SUBQ=''
        BF_SUB=''
        echo -e "${W}Not brute forcing${NC}"
    fi
}
multi_method(){
    echo -e "${W}Would you like to use more then one method of request?[GET, POST, PUT, DELETE]?(y/n)${NC}"
    read MMQ
    if [[ ${MMQ} == "y" ]]; then
        MMA='--methods'
    else
        MMA=''
    fi
}

cd /opt/Konan
if [[ -d /opt/sifter/results/Konan ]]; then
    echo ""
else
    mkdir /opt/sifter/results/Konan
fi
echo -e "${ORNG}Konan${NC}"
echo -e "${ORNG}*****${NC}"
echo -e "${YLW}"
cat files/pingtest_pass.txt
echo -e "${NC}"
echo -e "${W}Please enter your target site(without <https://> protocol)${NC}"
echo -e "${W}eg. example.com${NC}"
read TARGET
echo "================================================================================================="
word_list_q     //${WLISTD}
extention_q     //${EXT_RT}
ext_exclu       //${ST_EXCL}
word_list_split //${WLSA}
recursive_dir   //${DIRECTS}
brute_force     //${BF_SUB}
multi_method    //${MMA}
sleep 1
echo "================================================================================================="
cd /opt/Konan
sudo python3 konan.py --url https://${TARGET} ${WLISTA} ${WLISTD} ${CEXTQ} ${EXT_RT} ${FRC} ${EXTA} ${ST_EXCL} ${WLSA} ${RDA} ${DIRECTS} ${BF_SUBQ} ${BF_SUB} ${MMA} -O output.json
mv output.json /opt/sifter/results/Konan/${TARGET}.json
echo -e "${RED}Results have been saved to /opt/sifter/results/Konon/${NC}"
echo "================================================================================================="
./modules/module.sh
