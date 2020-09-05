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
        options=("Sitadel" "BFAC" "AapFinder" "OneFind" "XSStrike" "XSS-Freak" "Back")
        select opt in "${options[@]}"
        do
                case $opt in
                        "Sitadel")
                            ${COM} /opt/sifter/info/sitadel.info &>/dev/null
                            ;;

                        "AapFinder")
                            ${COM} /opt/sifter/info/aapfinder.info &>/dev/null
                            ;;

                        "BFAC")
                            ${COM} /opt/sifter/info/bfac.info &>/dev/null
                            ;;

                        "OneFind")
                            ${COM} /opt/sifter/info/onefind.info &>/dev/null
                            ;;

                         "XSStrike")
                            ${COM} /opt/sifter/info/xsstrike.info &>/dev/null
                            ;;

                        "XSS-Freak")
                            ${COM} /opt/sifter/info/XSS-Freak.info &>/dev/null
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
            options=("Seeker" "xRay" "Maryam" "theHarvester" "Osmedeus" "ReconSpider" "CredNinja" "Spiderfoot" "ODIN" "Back")
            select opt in "${options[@]}"
            do
                    case $opt in
                        "Seeker")
                            ${COM} /opt/sifter/info/seeker.info &>/dev/null
                            ;;

                        "xRay")
                            ${COM} /opt/sifter/info/xray.info &>/dev/null
                            ;;

                        "theHarvester")
                            ${COM} /opt/sifter/info/theHarvester.info &>/dev/null
                            ;;

                        "Osmedeus")
                            ${COM} /opt/sifter/info/osmedeus.info &>/dev/null
                            ;;

                        "ReconSpider")
                            ${COM} /opt/sifter/info/reconspider.info &>/dev/null
                            ;;

                        "Maryam")
                            ${COM} /opt/sifter/info/maryam.info &>/dev/null
                            ;;

                        "CredNinja")
                            ${COM} /opt/sifter/info/credninja.info &>/dev/null
                            ;;

                        "Spiderfoot")
                            ${COM} /opt/sifter/info/spiderfoot.info &>/dev/null
                            ;;

                        "ODIN")
                            ${COM} /opt/sifter/info/odin.info &>/dev/null
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
            options=("HoneyTel" "Back")
            select opt in "${options[@]}"
            do
                    case $opt in
                        "HoneyTel")
                            ${COM} /opt/sifter/info/honeytel.info &>/dev/null
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
          options=("aSnip" "Armory" "SayDog" "Back") 
          select opt in "${options[@]}"
          do
                  case $opt in
                        "Armory")
                            ${COM} /opt/sifter/info/armory.info &>/dev/null
                            ;;

                        "aSnip")
                            ${COM} /opt/sifter/info/asnip.info &>/dev/null
                            ;;

                        "SayDog")
                            ${COM} /opt/sifter/info/saydog.info &>/dev/null
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
          options=("Flan" "RapidScan" "Yuki-Chan" "Back")
          select opt in "${options[@]}"
          do
                  case $opt in
                        "Flan")
                            ${COM} /opt/sifter/info/flan.info &>/dev/null
                            ;;

                        "RapidScan")
                            ${COM} /opt/sifter/info/rapidscan.info &>/dev/null
                            ;;

                        "Yuki-Chan")
                            ${COM} /opt/sifter/info/yuki.info &>/dev/null
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
  figlet -f mini "Web Scanners &>/dev/null Network Modules"
  echo -e "${ORNG}"
  PS3='What tool would you like to use?'
          options=("BlackWidow" "wafw00f" "AttackSurfaceMapper" "Back")
          select opt in "${options[@]}"
          do
                  case $opt in
			            "BlackWidow")
                            ${COM} /opt/sifter/info/blackwidow.info &>/dev/null
                            ;;
                        
                        "AttackSurfaceMapper")
                            ${COM} /opt/sifter/info/asm.info &>/dev/null
                            ;;

                        "wafw00f")
                            ${COM} /opt/sifter/info/wafw00f.info &>/dev/null
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
                    ${COM} /opt/sifter/info/omega.info &>/dev/null
                    ;;                    

                "WinPwn")
                    ${COM} /opt/sifter/info/WinPwn.info &>/dev/null
                    ;;
                
                "ACLight")
                    ${COM} /opt/sifter/info/aclight.info &>/dev/null
                    ;;

                "InveighZero")
                    ${COM} /opt/sifter/info/inveighzero.info &>/dev/null
                    ;;

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
        options=("MkCheck" "BruteDUM" "ActiveReign" "NekoBot" "xShock" "VulnX" "WBruter" "Back")
        select opt in "${options[@]}"
        do
                case $opt in
                    "BruteDUM")
                            ${COM} /opt/sifter/info/brutedum.info &>/dev/null
                            ;;

                    "ActiveReign")
                            ${COM} /opt/sifter/info/activereign.info &>/dev/null
                            ;;

                    "MkCheck")
                            ${COM} /opt/sifter/info/mkcheck.info &>/dev/null
                            ;;

                    "NekoBot")
                            ${COM} /opt/sifter/info/nekobot.info &>/dev/null
                            ;;

                    "xShock")
                            ${COM} /opt/sifter/info/xshock.info &>/dev/null
                            ;;

                    "VulnX")
                            ${COM} /opt/sifter/info/vulnx.info &>/dev/null
                            ;;

                    "WBruter")
                            ${COM} /opt/sifter/info/wbruter.info &>/dev/null
                            ;;
                    
                    "Back")
                            cd /opt/sifter
                            ./sifter -m
                            ;;
                esac
        done
    echo -e "${NC}"
}

                                                                                ############
                                                                                #  RUNTIME #
                                                                                ############
python3 /opt/sifter/extras/ban.py
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