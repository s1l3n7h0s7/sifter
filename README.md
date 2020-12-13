<img align="left" src="https://img.shields.io/badge/Author-s1l3nt78-blueviolet"><a href="https://www.codefactor.io/repository/github/s1l3nt78/sifter"><img align="right" src="https://www.codefactor.io/repository/github/s1l3nt78/sifter/badge" alt="CodeFactor" /></a><br/>
<p align="center"><img align="center" src="https://img.shields.io/badge/-The_Dead_Bunny_Collective-green"></p>
<br />
<p align="center">
	<img align="center" src="https://raw.githubusercontent.com/s1l3nt78/sifter/master/docs/sifter.png">
<br>
  	<img align="center" src="https://img.shields.io/github/issues/s1l3nt78/sifter">
  	<img align="center" src="https://img.shields.io/github/forks/s1l3nt78/sifter">
  	<img align="center" src="https://img.shields.io/github/stars/s1l3nt78/sifter">		  
<br>
	<img align="center" src="https://img.shields.io/badge/@Codename:-Violet-violet"><br />
	<img align="center" src="https://img.shields.io/badge/Version-11-red">
	<img align="center" src="https://img.shields.io/badge/Revision-2-green">
</p>

# *Sifter*

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/6d36ac795cd14804b9ba24a06f94eef1)](https://app.codacy.com/gh/s1l3nt78/sifter?utm_source=github.com&utm_medium=referral&utm_content=s1l3nt78/sifter&utm_campaign=Badge_Grade)

<strong><em>s1l3nt78</em></strong>
<br>
<strong><em>~The Dead Bunny Collective~</em></strong>
<br />
*Because enumeration is key*
<br>
<br>

---------------------------------------------------------------------------------------------------------------------

# Notice

	[!] If you are the developer of any of the tools within Sifter and don't think your tool is 
	    being utilized to its full potential please let me know and i will take another look 
	    or optionally you can make an edit to the execution script of your specific tool and 
	    submit a pull request and I will review it within 12hrs
	
	[!] Or if you are a developer and would like your program added just submit an issue with the link 
	    and ill check it out and if it fits, I'll make the addition with 24-48hrs
	
---------------------------------------------------------------------------------------------------------------------

# Release

	@Codename: Violet
	@Version : 11
	@Revision: 2

<br>
<em>[<strong>Violet's</strong>] latest release's zip package can be downloaded from <a href="https://github.com/s1l3nt78/sifter/archive/master.zip"><strong>here</strong></a></em>
<br />
<em>[<strong>Violet's</strong>] latest .deb package is also available for download from <a href="https://github.com/s1l3nt78/sifter/releases/download/v11-r2/sifter_11-r2.deb"><strong>here</strong></a></em>
<br />
<em>Older Releases can be found <a href="https://github.com/s1l3nt78/sifter/archive/"><strong>here</strong></a></em>
<br>
<br>

---------------------------------------------------------------------------------------------------------------------

# Sifter Plugins

<details>
	<summary><strong># Released Extensions</strong></summary>
- <a href="https://github.com/Sifter-Ex/g">G</a> - Sifter's <em>g</em> extension gives a GUI overlay
<br />&emsp;	'--> Built on top of <a href="https://github.com/GitSquared/edex-ui">eDEX-UI</a><br />
- <a href="https://github.com/Sifter-Ex/f">F</a> - Sifter's <em>f</em> extension provides the DanderFuzz Exploitational Plugin for Sifter
<br />&emsp; '--> Framework created by the <a href="#">EquationGroup</a> courtesy of <a href="#">The Shadow Brokers</a><br />
  - <a href="https://github.com/Sifter-Ex/mPlug">M</a> - Sifter's <em>m</em> extension provided malware analysis tools.<br />
  - <a href="https://github.com/Sifter-Ex/cPlug">C</a> - Sifter's <em>c</em> extension is just a small script allowing CobaltStrike to be added to exploitation frameworks.<br /> 
&emsp;&emsp;	<em>(A copy of CobaltStrike will <strong>NOT</strong> be provided, <strong>You must provide your own</strong>)</em>
</details>

---------------------------------------------------------------------------------------------------------------------

# Additions:
<details>
	<summary><strong>__ Version: 11.r2 _|_ Violet __ </strong></summary>
- <strong>BetterSafetyKatz</strong> - Modified fork of SafetyKatz dynamically patching runtime, based on detected signatures using SharpSploit DInvoke to get it into memory<br />
- <strong>CVE-2018-8120</strong> - Added for extra Privilege Escalation options on a targte session<br />
- <strong>WebMap</strong> - WebMap provides an http web panel to interact with nMap<br />
- <strong>ThreatCheck</strong> - Checks a binary from disk or URL splits it until it pinpoints that exact bytes that the target engine will flag on and prints them to the screen.<br />
- <strong>Snaffler</strong> - Gather Windows computers from Active Directory, then searches out file shares, and whether you can read them.<br />
- <strong>WeblogicScanner</strong> - Weblogic Vulnerability Scanning Tool<br />
- <strong>PHPSploit</strong> - Full-featured C2 framework which silently persists on webserver via polymorphic PHP oneliner<br />
- <strong>EvilNET</strong> - WiFi offensive toolkit.<br />
- <strong>OSINTGram</strong> - Instagram OSINT tool<br />
- <strong>XAttacker-3.0</strong> - Vulnerability Scanner & Auto Exploiter <br />
- <strong>DroneSplit</strong> (<em>Optional</em>)- Hacking techniques and exploits especially focused on drone hacking.<br /> 
<br />
- Typing <strong>info</strong> into any menu will bring up the Module Information Screen.<br />
</em><br />
</details>

---------------------------------------------------------------------------------------------------------------------

<details>
<summary><strong># Removed:</strong></summary>
- BFAC
<br />
- Maryam
<br />
- ODIN
<br />
- xRay
<br />
- Removing redundant tools to make Sifter less bulky
</details>


---------------------------------------------------------------------------------------------------------------------

<h2>Menu:</h2>
<p>
<img align="center" src="https://raw.githubusercontent.com/s1l3nt78/sifter/master/docs/anon.png">
</p>

---------------------------------------------------------------------------------------------------------------------

# Overview

Sifter is a osint, recon & vulnerability scanner. It combines a plethara of tools within different module sets in order to quickly perform recon tasks, check network firewalling, enumerate remote and local hosts, and scan for the 'blue' vulnerabilities within microsoft and if unpatched, exploit them.  It uses tools like blackwidow and konan for webdir enumeration and attack surface mapping rapidly using ASM.
<br>
Gathered info is saved to the results folder, these output files can be easily parsed over to <a href="https://github.com/s1l3nt78/TigerShark">TigerShark</a> in order to be utilised within your campaign. Or compiled for a final report to wrap up a penetration test.
<br>
<br>
<a href="https://www.youtube.com/watch?v=YU-LYLjyO6c&t=8s">Setup Video</a>
<br>
<a href="https://youtu.be/QgAfqbxqbK0">Demo Video</a> (of Version 6-7. Newer tools and modules arent covered) - Its long, but you can skip
<br>
through to get the general idea. Most modules are explained along with demos of a lot of the tools.
<br>

---------------------------------------------------------------------------------------------------------------------

# Tested OS

	Working on: - Kali
		    - Parrot
		    - Ubuntu
		    - Linux (any distro)
		    - Windows (Linux Subsystem with Docker and VcXsrc installed correctly - for xterm use)
		    
Works on windows with linux-subsystem but please ensure docker is properly installed and configured, <br /> 
following the instructions from <a href="https://docker.io">docker website</a><br />
Untested on mac, though theoretically the same should apply to mac as windows - regarding docker install & tools

---------------------------------------------------------------------------------------------------------------------

# NOTE!! 

 If a scan does not work correctly at first, remove web-protocol from target. eg:
 <br>
 - use <strong>target.com</strong> 
 - instead of <strong>https;//target.com</strong>
 
---------------------------------------------------------------------------------------------------------------------

# Installation:
	
	[!] For oneliner install (Deb Package), copy and paste the following code into a terminal:
	*
	$ wget https://github.com/s1l3nt78/sifter/releases/download/v11-r2/sifter_11-r2.deb; sudo dpkg -i sifter_11-r2.deb; sifter
	
	
	[!] For oneliner install (source), copy and paste the following into a terminal:
	*
	$ git clone https://github.com/s1l3nt78/sifter.git && cd sifter && bash install.sh
	
	
	[!] Sifter Plugins can be found at https://github.com/Sifter-Ex
	[!] To install Sifter with plugins run:
	*
	$ git clone --recursive https://github.com/s1l3nt78/sifter; cd sifter; bash install.sh

----------------------------------------------------------------------------------------------------------------------

# Modules:
* Click to Expand

<details>
<summary><strong>#Enterprise Information Gatherers</strong></summary>
- <a href="https://github.com/laramies/theHarvester">theHarvester</a><br />
- <a href="https://github.com/j3ssie/Osmedeus">Osmedeus</a><br />
- <a href="https://github.com/bhavsec/reconspider">ReconSpider</a><br />
- <a href="https://github.com/Raikia/CredNinja">CredNinja</a><br />
- <a href="https://github.com/lockfale/OSINT-Framework">OSINT-Framework</a>
</details>

<details>
<summary>
<strong>#Targeted Information Gatherers</strong>
</summary>
- <a href="https://github.com/saeeddhqan/Maryam">Maryam</a><br />
- <a href="https://github.com/thewhiteh4t/seeker">Seeker</a><br />
- <a href="https://github.com/sherlock-project/sherlock">Sherlock</a><br />
- <a href="https://github.com/martinvigo/email2phonenumber">E2P (Email2Phone)</a><br />
- <a href="https://github.com/itsmehacker/CardPwn">CardPwn</a><br />
- <a href="https://github.com/kennbroorg/iKy">iKy</a><br />
- <a href="https://github.com/mxrch/GHunt">GHunt</a><br />
</details>

<details>
<summary>
<strong>#Domain Recon Gathering</strong></summary>
- <a href="https://github.com/elceef/dnstwist">DnsTwist</a><br />
- <a href="https://github.com/depthsecurity/armory">Armory</a><br />
- <a href="https://github.com/smicallef/spiderfoot">SpiderFoot</a><br />
- <a href="https://github.com/FooBallZ/pulsar">Pulsar</a><br />
- <a href="https://github.com/projectdiscovery/subfinder">SubFinder</a><br />
- <a href="https://github.com/Technowlogy-Pushpender/subdover">SubDover</a><br />
</p>
</details>

<details>
<summary>
<strong>#MicroSoft Exploitation</strong></summary>
- <a href="https://github.com/m8r0wn/ActiveReign">ActiveReign</a><br />
- <a href="https://github.com/Cyb0r9/ispy">iSpy</a><br />
- <a href="#">SMBGhost</a><br />
&emsp;&emsp;-- <a href="https://github.com/ioncube/SMBGhost">SMBGhost Scanner</a><br />
&emsp;&emsp;-- <a href="https://github.com/chompie1337/SMBGhost_RCE_PoC">SMBGhost Exploit</a><br />
</details>

<details>
<summary>
<strong>#Website Exploiters</strong></summary>
- <a href="#">DDoS</a><br />
&emsp;&emsp;-- <a href="https://github.com/s1l3nt78/Dark-Star">Dark-Star</a><br />
&emsp;&emsp;-- <a href="https://github.com/LimerBoy/Impulse">Impulse</a><br />
&emsp;&emsp;-- <a href="https://github.com/epsylon/ufonet">UFONet</a><br />
- <a href="https://github.com/tegal1337/NekoBotV1">NekoBot</a><br />
- <a href="https://github.com/capture0x/XSHOCK">xShock</a><br />
- <a href="https://github.com/anouarbensaad/vulnx">VulnX</a><br />
</details>

<details>
<summary>
<strong>#Exploit Searching</strong></summary>
- <a href="https://github.com/1N3/Findsploit">FindSploit</a><br />
- <a href="https://github.com/shodansploit/shodansploit">ShodanSploit</a><br />
</details>

<details>
<summary>
<strong>#Post-Exploitation</strong></summary>
- <a href="https://github.com/padovah4ck/CVE-2020-0683">EoP Exploit (Privilege Escalation Exploit)</a><br />
- Potatoes<br />
&emsp;&emsp;-- <a href="https://github.com/BeichenDream/BadPotato">BadPotato</a><br />
&emsp;&emsp;-- <a href="https://github.com/CCob/SweetPotato">SweetPotato</a><br />
- PEAS <br />
&emsp;&emsp;-- <a href="https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite">winPEAS</a><br />
&emsp;&emsp;-- <a href="https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite">linPEAS</a><br />
- <a href="https://github.com/S3cur3Th1sSh1t/WinPwn">WinPwn</a><br />
- <a href="https://github.com/Technowlogy-Pushpender/creds_harvester">CredHarvester</a><br />
- <a href="https://github.com/S3cur3Th1sSh1t/PowerSharpPack">PowerSharp</a><br />
- <a href="https://github.com/cyberark/ACLight">ACLight2</a><br />
- <a href="https://github.com/AdrianVollmer/PowerHub">PowerHub</a><br />
- <a href="https://github.com/Kevin-Robertson/InveighZero">InveighZero</a>		  
</details>

<details>
<summary>
<strong>#Exploitation Frameworks</strong></summary>
+ <a href="#">DanderFuzz</a> - Equation Group, Courtesy of the Shadow Brokers<br /> 
&emsp;&emsp;- FuzzBunch<br />
&emsp;&emsp;- Danderspritz<br />
	&emsp;(Provided by the <a href="https://github.com/Sifter-Ex/f">F</a> plugin.)<br />
<br />
+ <a href="#">CobaltStrike</a><br />
	&emsp; (Provided by the <a href="https://github.com/Sifter-Ex/cPlug">C</a> plugin.)<br />
+ <a href="https://github.com/nil0x42/phpsploit">PHPSploit</a><br />
+ <a href="https://github.com/entynetproject/thoron">Thoron</a><br />
+ <a href="https://metasploit.com">Metasploit</a><br />
</details>

<details>
<summary>
<strong>#Phishing</strong></summary>
+ <a href="https://github.com/s1l3nt78/TigerShark">TigerShark</a><br />
</details>

<details>
<summary>
<strong>#BruteForcing</strong></summary>
+ <a href="https://github.com/GitHackTools/BruteDum">BruteDUM</a><br />
+ <a href="https://github.com/wuseman/WBRUTER">WBruter</a><br />		  
</details>

<details>
<summary>
<strong>#Password Tools</strong></summary>
- <a href="https://github.com/sc0tfree/mentalist">Mentalist</a><br />
- <a href="https://github.com/k4m4/dcipher">DCipher</a><br />
- <a href="https://github.com/Ciphey/Ciphey">Ciphey</a><br />
</details>

<details>
<summary>
<strong>#Network Scanners</strong></summary>
- <a href="https://nmap.org">nMap</a><br />
- <a href="https://github.com/DeadNumbers/WebMap">WebMap</a><br />
- <a href="https://github.com/superhedgy/AttackSurfaceMapper">AttackSurfaceMapper</a><br />
- <a href="https://github.com/harleo/asnip">aSnip</a><br />
- <a href="https://github.com/EnableSecurity/wafw00f">wafw00f</a><br />
- <a href="#">Arp-Scan</a><br />
- <a href="https://www.github.com/josh0xA/Espionage">Espionage</a><br />
- <a href="https://github.com/intrigueio/intrigue-core">Intrigue-Core</a><br />
</details>

<details>
<summary>
<strong>#HoneyPot Detection Systems</strong></summary>
- <a href="https://github.com/aswinmguptha/HoneyCaught">HoneyCaught</a><br />
- <a href="https://github.com/MrSuicideParrot/SniffingBear">SniffingBear</a><br />
- <a href="https://github.com/Phype/telnet-iot-honeypot">HoneyTel (telnet-iot-honeypot)</a><br />
- <a href="https://github.com/hacklcx/HFish">HFish</a><br />
</details>

<details>
<summary>
<strong>#Vulnerability Scanners</strong></summary>
- <a href="https://github.com/cloudflare/flan">Flan</a><br />
- <a href="https://github.com/skavngr/rapidscan">Rapidscan</a><br />
- <a href="https://github.com/Yukinoshita47/Yuki-Chan-The-Auto-Pentest">Yuki-Chan</a><br />
- <a href="https://github.com/PowerScript/KatanaFramework">Katana-VF (Vulnerability Framework)</a><br />
- <a href="https://github.com/zdresearch/OWASP-Nettacker">OWASP-Nettacker</a><br />
- <a href="https://github.com/Technowlogy-Pushpender/CVE-2020-5902-Scanner">Big IP Remote Execution Scanner</a><br />
- <a href="https://github.com/0xn0ne/weblogicScanner">WeblogicScanner</a><br />
</details>

<details>
<summary>
<strong>#Router Tools</strong></summary>
- <a href="https://github.com/threat9/routersploit">RouterSploit</a><br />
- <a href="https://github.com/s1l3nt78/MkCheck">MkCheck</a><br />
- <a href="https://github.com/v1s1t0r1sh3r3/airgeddon">Airgeddon</a><br />
</details>

<details>
<summary>
<strong>#WebApplication Scanners</strong></summary>
- <a href="https://github.com/shenril/Sitadel">Sitadel</a><br />
- <a href="https://github.com/nyxgeek/onedrive_user_enum">OneFind</a><br />
- <a href="https://github.com/Technowlogy-Pushpender/aapfinder">AapFinder</a><br />
- <a href="https://github.com/yogeshojha/rengine">reNgine</a><br />
</details>

<details>
<summary>
<strong>#Website Scanners & Enumerators</strong></summary>
- <a href="https://github.com/sullo/nikto">Nikto</a><br />
- <a href="https://github.com/1N3/blackwidow">Blackwidow</a><br />
- <a href="#">Wordpress</a><br />
&emsp;&emsp;--- <a href="https://github.com/wpscanteam/wpscan">WPScan</a><br />
&emsp;&emsp;--- <a href="https://github.com/n00py/WPForce">WPForce/Yertle</a><br />
- <a href="https://github.com/Ekultek/Zeus-Scanner">Zeus-Scanner</a><br />
- <a href="#">Dirb</a><br />
- <a href="https://github.com/BullsEye0/dorks-eye">DorksEye</a><br />
- <a href="https://github.com/adnane-X-tebbaa/Katana">Katana-DS (Dork Scanner)</a><br />
</details>

<details>
<summary>
<strong>#Operational Security & Threat Analysis</strong></summary>
- <a href="https://github.com/QAX-A-Team/EventCleaner">EventCleaner</a><br />
- <a href="https://github.com/mike-goodwin/owasp-threat-dragon-desktop">Threat Dragon</a><br />
- <a href="https://github.com/dsnezhkov/TruffleSnout">TruffleSNout</a><br />
- <a href="https://github.com/SnaffCon/Snaffler">Snaffler</a><br />
</details>

<details>
<summary>
<strong>#Cross-Site Scripting & SQL Injection</strong></summary>
- <em>SQLinjection</em><br />
&emsp;&emsp;--- <a href="https://github.com/WhitewidowScanner/whitewidow">WhiteWidow</a><br />
&emsp;&emsp;--- <a href="https://github.com/v3n0m-Scanner/V3n0M-Scanner">V3n0M-Scanner</a><br />
- <em>Cross-Site Scripting</em><br />
&emsp;&emsp;--- <a href="https://github.com/s0md3v/XSStrike">XSStrike</a><br />
&emsp;&emsp;--- <a href="https://github.com/dwisiswant0/findom-xss">finDOM-XSS</a><br />
&emsp;&emsp;--- <a href="https://github.com/PR0PH3CY33/XSS-Freak">XSS-Freak</a>
</details>

<details>
<summary>
<strong>#Web Mini-Games</strong></summary>
- This was added in order to have a fun way to pass time<br />
&ensp;during the more time intensive modules.<br />
&ensp;Such as nMap Full Port scan or a RapidScan run.
</details>
---------------------------------------------------------------------------------------------------------------------

<br />
<img align="middle" src="https://raw.githubusercontent.com/s1l3nt78/sifter/master/docs/help.png">
<br />

---------------------------------------------------------------------------------------------------------------------

# Other Projects
<br />
All information on projects in development can be found <a href="https://s1l3nt78.github.io">here</a>. 
<br />
For any requests or ideas on current projects please submit an issue request to the corresponding tool.
<br />
For ideas or collaboration requests on future projects., contact details can be found on the page.
<br />
<br />
<em>GitHub Pages can be found here.
<br />
- <a href="https://s1l3nt78.github.io/MkCheck">MkCheck</a> = MikroTik Router Exploitation Tool
<br />
- <a href="https://s1l3nt78.github.io/TigerShark">TigerShark</a> = Multi-Tooled Phishing Framework</em>
<br />
<br />

	  <!--#############           VGhlIERlYWQgQnVubnkgQ29sbGVjdGl2ZQ==           #############--!>
	  
