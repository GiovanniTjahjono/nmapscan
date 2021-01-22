#!/bin/sh

#------------ATTENTION-------------
# Before running this script, please install the package
# git clone https://github.com/scipag/vulscan scipag_vulscan
# ln -s `pwd`/scipag_vulscan /usr/share/nmap/scripts/vulscan  

# run this command below
# ./scannmap.sh <IP TARGET> <FOLDER RESULT NAME>
# Example
# ./scannmap.sh 192.168.1.1 result

mkdir $2
cd $2
#malware scan
nmap -sV -oN malware.txt --script=vulscan/vulscan.nse $1  
#Malware Google scan
nmap -p80 -oN google_malware.txt --script http-google-malware $1
#basic scan UDP   
nmap -oN UDP.txt -sU UDP.txt $1     
#basic scan TCP   
nmap -oN TCP.txt -sT TCP.txt $1          
#popular port                             
nmap -oN popular.txt --top-ports $1      
#OS Services               
nmap -oN os_service.txt -A -T4 $1       
#CVE Detection
nmap -oN CVE.txt -Pn --script vuln $1        
#nmap -oN output.txt securitytrails.com
echo "------------------------------------------------------"
echo "|     II  II     II  III    III   II    _-----_       |"
echo "|     II   II   II  II II   II I  II  -         -     |"
echo "|     II    II II  II---II  II  I II  -  O   O  -     |"
echo "|     II     III  II     II II   III   -__   __-      |"
echo "|                                         ---         |"
echo "|            Scan is finished                         |"
echo "------------------------------------------------------|"