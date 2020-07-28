#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'
LVL='2'

cd /opt/bfac
echo -e "${ORNG}"
figlet -f mini "BFAC"
echo -e "${NC}"
echo -e "${W}Would you like to scan a single url or list or URL's?(s/l)${NC}"
read UCHK
if [[ ${UCHK} == 's' ]]; then
	echo -e "${W}Please enter your target${NC}"
	echo -e "${LP}eg. http://example.com/test.php ${NC}"
	read TARGET
	echo -e "${W}Would you like to check a different level?(y/n)${NC}"
	read LCHCE
	if [[ ${LCHCE} == 'y' ]]; then
		echo -e "${W}Please choice your level or hit enter for default (2)${NC}"
		read LVL
		FLVL='--level ${LVL}'
	else
		FLVL='--level ${LVL}'
	fi
	URL='--url ${TARGET} ${FLVL}'
else
	echo -e "${W}Please enter the full path/to/list.txt${NC}"
	read LIST
	URL='--list ${LIST}'
fi 

echo -e "${W}Would you like to verify file existing using content-length checks or status-code checks?(c/s)"
read CCHK
if [[ ${CCHK} == 'c' ]]; then
	CONTENT='--detection-technique content_length'
else
	CONTENT='--detection-technique status_code'
fi
echo "=============================================================================================="
if [[ ${UCHK} == 's' ]]; then
	bfac ${CONTENT} ${URL}
else
	bfac ${URL}
fi
sleep 5
cd /opt/sifter
./sifter -m

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################
