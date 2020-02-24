<p align="center">
 <img src="https://github.com/s1l3nt78/sifter/blob/master/.vs/sifter.png" alt="" />
</p>

<p align="center">
  <a href="#"><img align="center" src="https://img.shields.io/github/issues/s1l3nt78/sifter"</a>
  <a href="#"><img align="center" src="https://img.shields.io/github/forks/s1l3nt78/sifter"</a>
  <a href="#"><img align="center" src="https://img.shields.io/github/stars/s1l3nt78/sifter"</a>
<br>
  <a href="#"><img align="center" src="https://img.shields.io/badge/Version-2.5-red"</a>
  <a href="#"><img align="centre" src="https://img.shields.io/badge/Build-Topaz-yellowgreen"</a>
<br>
	 <a href="#"><img align="center" src="https://img.shields.io/badge/Author-s1l3nt78-yellowgreen"</a>
</p>

# Sifter
s1l3nt78
<br>
* Because the first step, is enumeration *
<br>
<br>
Sifter is a osint, recon & vulnerability scanner. It combines a plethara of tools within different module sets in order to quickly perform recon tasks, check network firewalling, enumerate remote and local hosts, and scan for the 'blue' vulnerabilities within microsft and if unpatched, exploit them.  It uses tools like blackwidow and konan for webdir enumeration and attack surface mapping rapidly using ASM.
<br>
Gathered info is saved to the results folder, these output files can be easily parsed over to <a href="https://github.com/s1l3nt78/TigerShark">TigerShark</a> in order to be utilised within your campaign. Or compiled for s final report to wrap up a penetration test.
<br>
<br>
# Please, if you fork this repo ensure to keep it updated.
<br>
	** Frequently updated
	<br>
	** Looking for a developer to help incorporate more offensive modules for exploitation, along side the recon.
	<br>

# Installation

	* This will download and install all required tools
	*
	$ git clone https://github.com/s1l3nt78/sifter.git
	$ cd sifter
	$ chmod +x install.sh
	$ ./install.sh

# Modules:
	* Information Modules
		-theHarvester '--> laramies - https://github.com/laramies/theHarvester
		-Osmedeus '--> j3ssie - https://github.com/j3ssie/Osmedeus
		-ReconSpider '--> bhavsec - https://github.com/bhavsec/reconspider
		-SniffingBear '--> MrSuicideParrot - https://github.com/MrSuicideParrot/SniffingBear

	* Domain Modules
		-Sublist3r '--> aboul3la - https://github.com/aboul3la/Sublist3r
		-DnsTwist '--> elceef - https://github.com/elceef/dnstwist
		-DomainFuzz '--> monkeym4ster - https://github.com/monkeym4ster/DomainFuzz
		-Armory '--> DepthSecurity - https://github.com/depthsecurity/armory

	* Exploitation Modules (Beta)
		-ActiveReign '--> m8r0wn - https://github.com/m8r0wn/ActiveReign
		-iSpy '--> Cyb0r9 - https://github.com/Cyb0r9/ispy
		-TigerShark '--> s1l3nt78 - https://github.com/s1l3nt78/TigerShark
		-ShodanSploit '--> ShodanSploit - https://github.com/shodansploit/shodansploit
		-NekoBot '--> tegal1337 - https://github.com/tegal1337/NekoBotV1

	* Network Modules
		-Nmap '--> Gordon Lyon - https://nmap.org
		-AttackSurfaceMapper '--> Superhedgy - https://github.com/superhedgy/AttackSurfaceMapper
		-aSnip '--> harleo - https://github.com/harleo/asnip
		-Armory '--> DepthSecurity - https://github.com/depthsecurity/armory

	* Vulnerability Scanners
		-Flan '--> Cloudflare - https://github.com/cloudflare/flan
		-Rapidscan '--> skavngr - https://github.com/skavngr/rapidscan
		-Yuki-Chan '--> Yukinoshita47 - https://github.com/Yukinoshita47/Yuki-Chan-The-Auto-Pentest

	* Web-App Modules
		-Photon '--> s0md3v - https://github.com/s0md3v/Photon
		-Sitadel '--> shenril - https://github.com/shenril/Sitadel
		-wafw00f '--> EnableSecurity - https://github.com/EnableSecurity/wafw00f

	* Web Modules
		-Nikto '--> Sullo - https://github.com/sullo/nikto
		-Blackwidow '--> 1N3 - https://github.com/1N3/blackwidow
		-WPScan '--> WPScanTeam - https://github.com/wpscanteam/wpscan
		-Konan '--> m4ll0k - https://github.com/m4ll0k/Konan


# Sifter Help Menu

  $ sifter	runs the programs bringing up the menu in a cli environment
  $ sifter	-c will check the existing hosts in the hostlist
  $ sifter	-a 'target-ip' appends the hostname/IP to host file
  $ sifter	-e Opens the Exploitation Module
  $ sifter	-i Opens the Info-based Module menu
  $ sifter 	-d Opens the Domain Focused Modules
  $ sifter 	-n Opens the Network Mapping Modules menu
  $ sifter	-w Opens the Website Focused Modules
  $ sifter	-wa Opens the Web-App Focused Module menu
  $ sifter	-v Opens the Vulnerability Scanning Module Menu
  $ sifter	-u Checks for/and installs updates
  $ sifter	-h This Help Menu

**TODO
	- Incorporation of exploitative modules

Any suggestions for extra modules are welcome.
Just submit an issue with your tool suggestion
Otherwise for developers just submit a pull request
