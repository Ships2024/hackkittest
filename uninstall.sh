#!/bin/bash

#            --------------------------------------------------
#                            Hack Kit Framework          
#            --------------------------------------------------
#                  Copyright (C) <2025>  <Ships2024>   
#
#        This program is free software: you can redistribute it and/or modify
#        it under the terms of the GNU General Public License as published by
#        the Free Software Foundation, either version 3 of the License, or
#        any later version.
#
#        This program is distributed in the hope that it will be useful,
#        but WITHOUT ANY WARRANTY; without even the implied warranty of
#        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#        GNU General Public License for more details.
#
#        You should have received a copy of the GNU General Public License
#        along with this program.  If not, see <http://www.gnu.org/licenses/>.

#yellow start 
	YS="\033[1;33m"
#blue start 
	BS="\033[0;34m"
#color end
	CE="\033[0m"
#red start
	RS="\033[1;31m"
#black start
	BLS="\033[0;30m"
#dark gray start
	DGYS="\033[1;30m"
#light blue start
	LBS="\033[1;34m"
#green start
	GNS="\033[0;32m"
#light green start
	LGNS="\033[1;32m"
#cyan start
	CYS="\033[0;36m"
#light cyan start
	LCYS="\033[1;36m"
#light red start
	DRS="\033[0;31m"
#purple start
	PS="\033[0;35m"
#light purple start
	LPS="\033[1;35m"
#brown start
	BRS="\033[0;33m"
#light gray start
	LGYS="\033[0;37m"
#white start
	WHS="\033[1;37m"
	
printf '\033]2;uninstall.sh\a'

if [[ $EUID -ne 0 ]]
then
   sleep 1
   echo -e "["$RS"*"$CE"] "$RS"This script must be run as "$YS"root"$RS"!"$CE"" 1>&2
   sleep 1
   exit
fi

clear
CAT="$( cat /etc/hacktestkit/password )"
if [[ "$CAT" = "" ]]
then
clear
else
cd /root/hacktestkit/lib
chmod +x libdec
./libdec
logins="$(cat /etc/hacktestkit/login)"
cd /root/hacktestkit/lib
chmod +x libenc
./libenc

sleep 0.5
read -e -p $'(\033[4;93mlogin\033[0m\en)> ' loginer


while [ "$loginer" = "root" ]
do
sleep 0.5
echo -e "["$RS"*"$CE"] "$RS"Failed to open session for root!"$CE""
sleep 0.5
read -e -p $'(\033[4;93mlogin\033[0m\en)> ' loginer
done

while [ "$loginer" != "$logins" ]
do
echo -e "["$RS"*"$CE"] "$RS"Wrong login!"$CE""
sleep 3
sleep 0
read -e -p $'(\033[4;93mlogin\033[0m\en)> ' loginer

done

sleep 0.5
cd /root/hacktestkit/lib
chmod +x libdec
./libdec
passwords="$(cat /etc/hacktestkit/password)"
cd /root/hacktestkit/lib
chmod +x libenc
./libenc
read -s -p $'(\033[4;93mpassword\033[0m\en)> ' passworder
while [ "$passworder" != "$passwords" ]
do
echo -e
echo -e "["$RS"*"$CE"] "$RS"Wrong password!"$CE""
sleep 3
sleep 0
read -s -p $'(\033[4;93mpassword\033[0m\en)> ' passworder
done
fi

printf '\033]2;Uninstalling...\a'

{
	      cd /root/hacktestkit/lib
	      chmod +x libunchattr
	      ./libunchattr
	      cd /root/hacktestkit/lib
	      chmod +x libunconf
	      ./libunconf
              cd /root/hacktestkit/lib
              chmod +x liunlogin
              ./libunlogin
	      rm /usr/share/applications/hacktestkit.desktop
	      rm /root/Desktop/hacktestkit.desktop
	      rm -rf /root/hacktestkit
	      rm -rf /etc/hacktestkit
	      rm -rf /root/handshakes
	      rm -rf /root/wordlists
} &> /dev/null

echo -e
echo -e

function ProgressBar {

    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done

    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

                         
        
printf "\rUninstalling: [${_fill// /\#}${_empty// /-}] ${_progress}%%"

}


_start=1

_end=100

for number in $(seq ${_start} ${_end})
do
    sleep 0.2
    ProgressBar ${number} ${_end}
done

echo -e
echo -e
		echo -e "["$YS"inf"$CE"] "$YS"Done"$CE""
		sleep 2
		echo -e "Press "$YS"any key"$CE" to exit..."
		read
		clear
		exit
