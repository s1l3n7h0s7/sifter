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
multi() {
	options=("Full Port" "Common Vulnerabilities" "UDP Port Scan" "Back")
		select opts in "${options[@]}"
		do
			case $opts in
				"Full Port")
					echo -e "${RED}NOTE: This option takes +- 30mins per host.${NC}"
					echo -e "${W}Would you like to continue?(y/n)${NC}"
					# shellcheck disable=SC2162
					read REPLY
					if [[ $REPLY == y ]]; then
						echo -e "${RED}*${YLW}You can goto ${LP}Pass Time${YLW} in the module menu to kill some time while you wait${NC}"
						echo -e "${YLW}"
						sudo nmap -p- -Pn -O -A -iL files/pingtest.pass
						echo -e "${NC}"
						sleep 5
						cd /opt/sifter
						sifter -m
					else
						cd /opt/sifter
						sifter -m
					fi
					;;

				"Common Vulnerabilities")
					echo -e "${YLW}"
					sudo nmap -sS -Pn -O -A -sV -iL files/pingtest.pass
					echo -e "${NC}"
					sleep 5
					cd /opt/sifter
					sifter -m
					;;

				"UDP Port Scan")
					echo -e "${YLW}"
					sudo nmap -sU -Pn -O -A -iL files/pingtest.pass
					echo -e "${NC}"
					sleep 5
					cd /opt/sifter
					sifter -m
					;;

				"Back")
					cd /opt/sifter
					sifter -m
					;;
				esac
			done
}
single() {
	options=("Full Port" "Common Vulnerabilities" "UDP Port Scan" "Back")
		select opts in "${options[@]}"
		do
			case $opts in
				"Full Port")
					echo -e "${RED}NOTE: This option takes +- 30mins${NC}"
					echo -e "${W}Would you like to continue?(y/n)${NC}"
					read REPLY
					if [[ $REPLY == y ]]; then
						echo -e "${YLW}"
						cat files/host_list.txt
						echo -e "${NC}"
						echo -e "${W}Please copy and paste in your target${NC}"
						read TARGET
						echo "================================================================================================="
						sudo nmap -p- -Pn -O -A ${TARGET}
						echo "================================================================================================="
						cd /opt/sifter
						sifter -m
					else
						./modules/netmods/nmap.sh
					fi
					;;

				"Common Vulnerabilities")
					echo -e "${YLW}"
					cat files/host_list.txt
					echo -e "${NC}"
					echo -e "${W}Please copy and paste in your target${NC}"
					read TARGET
					echo "================================================================================================="
					sudo nmap -sS -Pn -O -A -sV ${TARGET}
					echo "================================================================================================="
					cd /opt/sifter
					sifter -m
					;;

				"UDP Port Scan")
					echo -e "${YLW}"
					cat files/host_list.txt
					echo -e "${NC}"
					echo -e "${W}Please copy and paste in your target${NC}"
					read TARGET
					echo "================================================================================================="
					sudo nmap -sU -Pn -O -A ${TARGET}
					echo "================================================================================================="
					cd /opt/sifter
					sifter -m
					;;

				"Back")
					cd /opt/sifter
					sifter -m
					;;
			esac
		done
}

echo -e "${ORNG}nMap${NC}"
echo -e "${ORNG}*****${NC}"
echo -e "${W}Would you like to run nMap against a singular target or all the targets on the hostlist?${NC}"
options=("Single Target" "Multiple Targets" "Back")
select opts in "${options[@]}"
do
	case $opts in
		"Single Target")
			single
			;;

		"Multiple Targets")
			multi
			;;

		"Back")
			cd /opt/sifter
			sifter -m
			;;
	esac
done


##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################
