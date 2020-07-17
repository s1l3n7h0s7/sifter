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
KD=$(kdialog -h)
if [[ ${KD} == "" ]]; then
    COM='cat'
else
    COM='kdialog --geometry 600x800 --textbox'
fi 
webappinfo(){
  cd /opt/sifter
  echo -e "${RED}"
  figlet -f mini "WebAppplication Scanners"
  echo -e "${ORNG}"
  PS3='What tool would you like to use?'
        options=("Sitadel" "BFAC" "AapFinder" "OneFind" "XSStrike" "XSS-Freak" "Back" "Quit")
        select opt in "${options[@]}"
        do
                case $opt in
                        "Sitadel")
                            ${COM} /opt/sifter/info/sitadel.info &
                            ;;

                        "AapFinder")
                            ${COM} /opt/sifter/info/aapfinder.info &
                            ;;

                        "BFAC")
                            ${COM} /opt/sifter/info/bfac.info &
                            ;;

                        "OneFind")
                            ${COM} /opt/sifter/info/onefind.info &
                            ;;

                         "XSStrike")
                            ${COM} /opt/sifter/info/xsstrike.info &
                            ;;

                        "XSS-Freak")
                            ${COM} /opt/sifter/info/XSS-Freak.info &
                            ;;

                        "Back")
                            cd /opt/sifter
                            ./sifter -m
                            ;;
                esac
        done
    echo -e "${NC}"
}
# Info Module-Category Selection
credinfo(){
    cd /opt/sifter
    echo -e "${RED}"
    figlet -f mini "Information Gatherers"
    echo -e "${ORNG}"
    PS3='Which module category would you like to use?'
            options=("Seeker" "xRay" "Maryam" "theHarvester" "Osmedeus" "ReconSpider" "CredNinja" "Spiderfoot" "ODIN" "Back" "Quit")
            select opt in "${options[@]}"
            do
                    case $opt in
                        "Omnibus")
                            ${COM} /opt/sifter/info/omnibus.info &
                            ;;

                        "Seeker")
                            ${COM} /opt/sifter/info/seeker.info &
                            ;;

                        "xRay")
                            ${COM} /opt/sifter/info/xray.info &
                            ;;

                        "theHarvester")
                            ${COM} /opt/sifter/info/theHarvester.info &
                            ;;

                        "Osmedeus")
                            ${COM} /opt/sifter/info/osmedeus.info &
                            ;;

                        "ReconSpider")
                            ${COM} /opt/sifter/info/reconspider.info &
                            ;;

                        "Maryam")
                            ${COM} /opt/sifter/info/maryam.info &
                            ;;

                        "CredNinja")
                            ${COM} /opt/sifter/info/credninja.info &
                            ;;

                        "Spiderfoot")
                            ${COM} /opt/sifter/info/spiderfoot.info &
                            ;;

                        "ODIN")
                            ${COM} /opt/sifter/info/odin.info &
                            ;;

                        "Back")
                            cd /opt/sifter
                            ./sifter -m
                            ;;
                    esac
            done
        echo -e "${NC}"

}
# HoneyPot Scanners
honey_info(){
    cd /opt/sifter
    echo -e "${RED}"
    figlet -f mini "HoneyPot Detection Systems"
    echo -e "${LP}This module focuses on Enterprises and their online presence"
    echo -e "${YLW}eg. web-directories, enterprise email addresses, etc."
    echo -e "${ORNG}"
    PS3='What tool would you like to use?'
            options=("HoneyTel" "Back" "Quit")
            select opt in "${options[@]}"
            do
                    case $opt in
                        "HoneyTel")
                            ${COM} /opt/sifter/info/honeytel.info &
                            ;;

                        "Back")
                            cd /opt/sifter
                            ./sifter -m
                            ;;
                    esac
            done
        echo -e "${NC}"

}
# Domain Modules
dominfo(){
  cd /opt/sifter
  echo -e "${RED}"
  figlet -f mini "Domain Recon Gathering"
  echo -e "${ORNG}"
  PS3='What tool would you like to use?'
          options=("aSnip" "Armory" "SayDog" "Back" "Quit") 
          select opt in "${options[@]}"
          do
                  case $opt in
                        "Armory")
                            ${COM} /opt/sifter/info/armory.info &
                            ;;

                        "aSnip")
                            ${COM} /opt/sifter/info/asnip.info &
                            ;;

                        "SayDog")
                            ${COM} /opt/sifter/info/saydog.info &
                            ;;

                        "Back")
                            cd /opt/sifter
                            ./sifter -m
                            ;;
                    esac
            done
            echo -e "${NC}"
}

# Vulnerability Scanners
vulninfo(){
  cd /opt/sifter
  echo -e "${RED}"
  figlet -f mini "Vulnerability Scanners"
  echo -e "${ORNG}"
  PS3='What tool would you like to use?'
          options=("Flan" "RapidScan" "Yuki-Chan" "Back" "Quit")
          select opt in "${options[@]}"
          do
                  case $opt in
                        "Flan")
                            ${COM} /opt/sifter/info/flan.info &
                            ;;

                        "RapidScan")
                            ${COM} /opt/sifter/info/rapidscan.info &
                            ;;

                        "Yuki-Chan")
                            ${COM} /opt/sifter/info/yuki.info &
                            ;;

                           "Back")
                            cd /opt/sifter
                            ./sifter -m
                            ;;
                    esac
            done
            echo -e "${NC}"
}
# Web-Focused Modules
web_netinfo(){
  cd /opt/sifter
  echo -e "${RED}"
  figlet -f mini "Web Scanners & Network Modules"
  echo -e "${ORNG}"
  PS3='What tool would you like to use?'
          options=("BlackWidow" "wafw00f" "AttackSurfaceMapper" "" "Back" "Quit")
          select opt in "${options[@]}"
          do
                  case $opt in
			            "BlackWidow")
                            ${COM} /opt/sifter/info/blackwidow.info
                            ;;
                        
                        "AttackSurfaceMapper")
                            ${COM} /opt/sifter/info/asm.info
                            ;;

                        "wafw00f")
                            ${COM} /opt/sifter/info/wafw00f.info
                            ;;

                        "Back")
                            cd /opt/sifter
                            ./sifter -m
                            ;;
                    esac
            done
            echo -e "${NC}"
}
# Post Exploitation
postinfo(){
    echo -e "${RED}"
    figlet -f mini "Post-Exploitation"
    echo -e "${NC}"
    PS3='What tool would you like to use?'
        options=("Omega" "WinPwn" "ACLight2" "InveighZero" "Back")
        select opt in "${options[@]}"
        do
            case $opt in
                "Omega")
                    ${COM} /opt/sifter/info/omega.info &
                    ;;                    

                "WinPwn")
                    ${COM} /opt/sifter/info/WinPwn.info &
                    ;;
                
                "ACLight")
                    ${COM} /opt/sifter/info/aclight.info &
                    ;;

                "InveighZero")
                    ${COM} /opt/sifter/info/inveighzero.info &

               "Back")
                    cd /opt/sifter
                    ./sifter -m
                    ;;

            esac
        done
    echo -e "${NC}"
}
# Exploitation Modules
exmodinfo(){
  cd /opt/sifter
  echo -e "${RED}"
  figlet -f mini "Exploitation Tools"
  echo -e "${ORNG}"
  PS3='What tool would you like to use?'
        options=("MkCheck" "BruteDUM" "ActiveReign" "NekoBot" "xShock" "VulnX" "Back" "Quit")
        select opt in "${options[@]}"
        do
                case $opt in
                    "BruteDUM")
                            ${COM} /opt/sifter/info/brutedum.info &
                            ;;

                    "ActiveReign")
                            ${COM} /opt/sifter/info/activereign.info &
                            ;;

                    "MkCheck")
                            ${COM} /opt/sifter/info/mkcheck.info &
                            ;;

                    "NekoBot")
                            ${COM} /opt/sifter/info/nekobot.info &
                            ;;

                    "xShock")
                            ${COM} /opt/sifter/info/xshock.info &
                            ;;

                    "VulnX")
                            ${COM} /opt/sifter/info/vulnx.info &
                            ;;

                    "WBruter")
                            ${COM} /opt/sifter/info/wbruter.info
                            ;;
                    
                    "Back")
                            cd /opt/sifter
                            ./sifter -m
                            ;;
                esac
        done
    echo -e "${NC}"
}
echo -e "${URED}Modules${NC}"
echo -e "${ORNG}"
PS3='What would you like to do?'
        options=("Exploitation Tools" "Post-Exploitation" "Web Scanners & Network Modules" "Vulnerability Scanners" "Domain Recon Gathering" "HoneyPot Detection Systems" "Information Gatherers" "WebAppplication Scanners" "Main Menu" "Back" "Quit")
        select opt in "${options[@]}"
        do
                case $opt in
                        "Information Gatherers")
                            credinfo
                            ;;

                        "Domain Recon Gathering")
                            dominfo
                            ;;

                        "Website Scanners & Enumerators")
                            web_netinfo
                            ;;

                        "Vulnerability Scanners")
                            vulninfo
                            ;;

                        "HoneyPot Detection Systems")
                            honey_info
                            ;;

                        "Exploitation Tools")
                            exmodinfo
                            ;;

			            "WebAppplication Scanners")
			                webappinfo
			                ;;
                            
                        "Post-Exploitation")
                            postinfo
                            ;;

                        "Main Menu")
                            cd /opt/sifter
                            ./sifter
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

##########################______________ czFsM250NzggX18gUmFiYjE3J3MgRGVu ______________##########################