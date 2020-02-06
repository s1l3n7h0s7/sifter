# sifter

Sifter is a recon tool, originally designed to check the status of domains/hosts/ip's

From there a few extra tools were integrated in to further the info gathering process.



Modules:
**********

	-Nmap '--> Gordon Lyon - https://nmap.org

	-Nikto '--> Sullo - https://github.com/sullo/nikto

	-Dirbuster '--> mgeeky - https://github.com/mgeeky/dirbuster

	-Blackwidow '--> 1N3 - https://github.com/1N3/blackwidow

	-WPScan '--> WPScanTeam - https://github.com/wpscanteam/wpscan

	-Yuki-Chan '--> Yukinoshita47 - https://github.com/Yukinoshita47/Yuki-Chan-The-Auto-Pentest
	
	-AttackSurfaceMapper '--> Superhedgy - https://github.com/superhedgy/AttackSurfaceMapper 
	
	-theHarvester '--> laramies - https://github.com/laramies/theHarvester
	
	-Photon '--> s0md3v - https://github.com/s0md3v/Photon
	
	-Flan '--> Cloudflare - https://github.com/cloudflare/flan.git
	
	-Rapidscan '--> skavngr - https://github.com/skavngr/rapidscan
	
	-Sublist3r '--> aboul3la - https://github.com/aboul3la/Sublist3r
	
	-DnsTwist '--> elceef - https://github.com/elceef/dnstwist

Sifter Help Menu
*****************


	$	-c will check the exsiting hosts in the hostlist
	$	-s Runs the AttackSurfaceMapper module against target or host list
	$	-a 'x.x.x.x' Target appended to host file
	$	-m starts the program under the module menu with the existing host_list.txt
	$	-b Runs Blackwidow against the existing hosts in the files/host_list.txt
	$	-n Runs Nikto using the existing hosts in the files/host_list.txt
	$	-v Runs the DnsTwist module against a given target
 	$	-d Runs Dirbuster against existing hosts in the files/host_list.txt
	$	-w Runs WPScan against the existing hosts in the files/host_list.txt
	$	-p Runs Nmap against the existing hosts in the files/host_list.txt
	$	-t Runs theHarvester against target or host list
	$	-r Runs that rapidscan module against a given target.
	$	-f Runs the Flan modules against a given target
	$	-i Runs the Sublist3r module against a given target
	$	-e Runs the Sn1per module against a target or host list
	$	-z Runs the AttackSurfaceMapper module against a given target
	$	-o Runs the Photon OSINT module against target or host list
	$	-y Runs the Yuki-Chan module against current host file
	$	-u Updates sifter from Github
 	$  	-h Help Menu
	 

Any suggestions for extra modules are welcome.
Just submit an issue with your tool suggestion
Otherwise for developers just submit a pull request 
