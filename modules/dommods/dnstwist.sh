#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
listing(){
    echo -e "${YLW}"
    cat /opt/sifter/files/pingtest.pass
    echo -e "${NC}"
}
check(){
    if [[ -d '/opt/sifter/results/DnsTwist' ]]; then
        echo ""
    else
        mkdir /opt/sifter/results/DnsTwist
    fi
}

cd /opt/dnstwist
source env/bin/activate
echo -e "${RED}"
figlet -f mini "DnsTwist"
echo -e "${NC}"
check
listing
echo -e "${W}Please enter your target${NC}"
read TARGET
sleep 1
echo -e "${LP}These scans will take a while but will finish\nPlease just be patient${NC}"
mkdir /opt/sifter/results/DnsTwist/${TARGET}
echo -e "${RED}Performing 'registered' test${NC}"
sudo ./dnstwist.py --registered ${TARGET} > /opt/sifter/results/DnsTwist/${TARGET}/registered_test.csv
echo -e "${RED}Performing ssdeep test${NC}"
sudo ./dnstwist.py --ssdeep ${TARGET} > /opt/sifter/results/DnsTwist/${TARGET}/ssdeep_test.csv
echo -e "${RED}Performing GeoIP test${NC}"
sudo ./dnstwist.py --geoip ${TARGET} > /opt/sifter/results/DnsTwist/${TARGET}/geoip_test.csv
echo -e "${RED}Performing mxcheck test${NC}"
sudo ./dnstwist.py --mxcheck ${TARGET} > /opt/sifter/results/DnsTwist/${TARGET}/mxcheck_test.csv
echo -e "${RED}Performing TLD test${NC}"
sudo ./dnstwist.py --tld dictionaries/common_tlds.dict ${TARGET} > /opt/sifter/results/DnsTwist/${TARGET}/tld_test.csv
echo -e "${W}"
figlet -f mini "Done"
echo -e "Results saved to /opt/sifter/results/DnsTwist/${TARGET}${NC}"
cd /opt/sifter
sifter -m

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################
