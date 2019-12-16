#!/usr/bin/bash
#FellFreeToRecode
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
BlueF='\e[1;34m'
LIMITATOR=5
clear
BANNERS () {
printf "${white}
${lightgreen}.____    .____________________________________.____     __________
|    |   |   \__    ___/\__    ___/\_   _____/|    |    \____    /
|    |   |   | |    |     |    |    |    __)_ |    |      /     / 
|    |___|   | |    |     |    |    |        \|    |___  /     /_ 
|_______ \___| |____|     |____|   /_______  /|_______ \/_______ \                      
                       ${white} Little Advance Scanner\n
"
}
BANNERS
OPTIONS () {
printf "${red}[>]${white} List                        :${lightgreen} "
read list
printf "${red}[>]${white} Path                        :${lightgreen} "
read path
printf "${red}[>]${white} Keyword                     :${lightgreen} "
read keyword
printf "${red}[>]${white} Save As                     :${lightgreen} "
read save
site=$(cat $list)
}
OPTIONS
printf "\n${lightgreen}Now Checking...\n\n"
for site in $(cat $list);
do
((cthread=cthread%LIMITATOR)); ((cthread++==0)) && wait
if [[ $(curl --connect-timeout 3 --max-time 3 -kLs "${site}/${path}/" ) =~ "${keyword}" ]]; then
  printf "${white}[+]${site} is ${lightgreen} vuln\n"
  echo "$site/$path/" >> ${save}
else
  printf "${white}[+] ${site} is ${red} Bad\n"
fi
done
printf "\n${lightgreen}Save as ${save}...\n\n"
