#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

echo -e "${ORNG}"
figlet -f mini "FindSploit"
echo -e "${NC}"
cd /opt/Findsploit
echo -e "${LP}This tool allows you to search, copy or compile exploits"
  echo -e "${ORNG}"
echo -e "${ORNG}=========================================================================="
echo -e "${YLW}Search for all exploits and modules using a single search term:"
echo -e "*  findsploit <search_term_1> (ie. findsploit apache)"
echo ""
echo -e "Search multiple search terms:"
echo -e "*  findsploit <search_term_1> <search_term_2> <search_term_3> ..."
echo ""
echo -e "Show all NMap scripts:"
echo -e "*  findsploit nmap "
echo ""
echo -e "Search for all FTP NMap scripts:"
echo -e "*  findsploit nmap | grep ftp"
echo ""
echo -e "Show all Metasploit auxiliary modules:"
echo -e "*  findsploit auxiliary"
echo ""
echo -e "Show all Metasploit exploits:"
echo -e "*  findsploit exploits"
echo ""
echo -e "Show all Metasploit encoder modules:"
echo -e "*  findsploit encoder"
echo ""
echo -e "Show all Metasploit payloads modules:"
echo -e "*  findsploit payloads"
echo ""
echo -e "Search all Metasploit payloads for windows only payloads:"
echo -e "*  findsploit payloads | grep windows"
echo ""
echo -e "${ORNG}==========================================================================${NC}"
  PS3='What would you like to do?'
          options=("Find" "Copy" "Compile" "Back" "Quit")
          select opt in "${options[@]}"
          do
                  case $opt in
                        "Find")
                            echo -e "${W}Please enter the term to use with findsploit${NC}"
                            read ARGS
                            xterm sudo ./findsploit ${ARGS}sleep 2
                            cd /opt/sifter
                            ./sifter -m
                            ;;

                        "Copy")
                            echo -e "${W}Please enter the term to use with copysploit${NC}"
                            read ARGS
                            xterm sudo ./copysploit ${ARGS}
                            sleep 2
                            cd /opt/sifter
                            ./sifter -m
                            ;;
                            
                        "Compile")
                            echo -e "${W}Please enter the term to use with compilesploit${NC}"
                            read ARGS
                            xterm sudo ./compilesploit ${ARGS}
                            sleep 2
                            cd /opt/sifter
                            ./sifter -m
                            ;;

                        "Back")
                            cd /opt/sifter
                            ./sifter -m
                            ;;

                        "Quit")
                            exit 0
                            ;;
                  esac
          done
echo -e "${NC}"

##########################______________ czFsM250NzggX18gUmFiYjE3J3MgRGVu ______________##########################
