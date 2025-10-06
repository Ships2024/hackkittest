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

CE="\033[0m"
RS="\033[1;31m"
YS="\033[1;33m"
WHS="\033[1;37m"

printf '\033]2;install.sh\a'

if [[ $EUID -ne 0 ]]
then
   sleep 1
   echo -e "["$RS"*"$CE"] "$RS"This script must be run as "$YS"root"$RS"!"$CE"" 1>&2
   sleep 1
   exit
fi

clear

if [[ -d /root/hacktestkit ]]
then
sleep 0.5
else
if [[ -d /root ]]
then
cd /root
{
git clone https://github.com/Ships2024/hacktestkittest.git
} &> /dev/null
cd /root/hacktestkit
chmod +x install.sh
cd /root/hacktestkit
else
mkdir /root
{
git clone https://github.com/Ships2024/hacktestkittest.git
} &> /dev/null
cd /root/hacktestkit
chmod +x install.sh
cd /root/hacktestkit
fi
fi

cd /root/hacktestkit/lib
chmod +x libactiv
./libactiv

else
sleep 1
echo -e "["$RS"*"$CE"] "$RS"Can't connect to server: There is no connection!"$CE""
sleep 1
exit
fi
fi

printf '\033]2;install.sh\a'

clear
chmod +x /root/hacktestkit/eht/eht1
chmod +x /root/hacktestkit/eht/eht2
chmod +x /root/hacktestkit/eht/eht3
chmod +x /root/hacktestkit/eht/eht21
chmod +x /root/hacktestkit/eht/eht31
chmod +x /root/hacktestkit/bin/hacktestkit
chmod +x /root/hacktestkit/dev/dev1
chmod +x /root/hacktestkit/dev/dev2
chmod +x /root/hacktestkit/dev/dev21
chmod +x /root/hacktestkit/uninstall.sh
chmod +x /root/hacktestkit/bin/ehtmod
chmod +x /root/hacktestkit/bin/ehtconsole
chmod +x /root/hacktestkit/bin/ehtapp
chmod +x /root/hacktestkit/bin/epasswd
cd /root/hacktestkit
cp /root/hacktestkit/bin/hacktestkit /bin
chmod +x /bin/hacktestkit
cp /root/hacktestkit/bin/ehtapp /bin
chmod +x /bin/ehtapp
cp /root/hacktestkit/bin/epasswd /bin
chmod +x /bin/epasswd
cp /root/hacktestkit/bin/ehtmod /bin
chmod +x /bin/ehtmod
mkdir /etc/hacktestkit
mkdir /etc/hacktestkit/root
cp /root/hacktestkit/etc/root/password /etc/hacktestkit/root
mkdir /etc/hacktestkit/app
cp /root/hacktestkit/app/hacktestkit.png /etc/hacktestkit/app
mkdir /etc/hacktestkit/hacktestkitd
cp /root/hacktestkit/bin/ehtconsole /etc/hacktestkit/hacktestkitd
chmod +x /etc/hacktestkit/hacktestkitd/ehtconsole

clear
if [[ ! -d /root/handshakes ]]
then
	mkdir /root/handshakes
	sleep 0
else
	sleep 0
fi
if [[ ! -d /root/wordlists ]]
then
	mkdir /root/wordlists
	sleep 0
else
	sleep 0
fi
clear
sleep 3
echo -e "What desktop shell do you use?"
echo -e
echo -e ""$YS"1"$CE") Gnome"
echo -e ""$YS"2"$CE") Xfce"
echo -e ""$YS"3"$CE") KDE"
echo -e
read -e -p $'(\033[4;93mdesktop\033[0m\en)> ' xdesk

if [[ $xdesk = "1" ]]
then
{
chattr -i /etc/hacktestkit
mkdir /etc/hacktestkit/xdesktop
echo "gnome-terminal" >> /etc/hacktestkit/xdesktop/config.txt
chattr +i /etc/hacktestkit
} &> /dev/null

elif [[ $xdesk = "2" ]]
then
{
chattr -i /etc/hacktestkit
mkdir /etc/hacktestkit/xdesktop
echo "xfce4-terminal" >> /etc/hacktestkit/xdesktop/config.txt
chattr +i /etc/hacktestkit
} &> /dev/null

elif [[ $xdesk = "3" ]]
then
{
chattr -i /etc/hacktestkit
mkdir /etc/hacktestkit/xdesktop
echo "konsole" >> /etc/hacktestkit/xdesktop/config.txt
chattr +i /etc/hacktestkit
} &> /dev/null
fi

clear
printf '\033]2;install.sh\a'
sleep 3
echo -e "Do you want to install hacktestkit modules now?(\033[1;33myes\033[0m/\033[1;33mno\033[0m): "
echo -e "So without thinking install them now!"
echo -e "Only use 'yes' for the best way!"
read -e -p $'(\033[4;93minstall\033[0m\en)> ' UORI

if [[ "$UORI" = "no" ]]
then 
	clear
	echo -e "OK..."
	sleep 1
	echo -e "To install hacktestkit modules, run '"$YS"ehtmod -i"$CE"'"
	sleep 3
	clear
        
elif [[ "$UORI" = "yes" ]]
then
      clear
      echo -e "OK..."
      sleep 1
      echo -e "Please wait..."
      sleep 1
      echo -e "Launching..."
      sleep 1
      ehtmod -i
fi

clear
printf '\033]2;install.sh\a'
sleep 3
echo -e "Do you want to protect hacktestkit with password?(\033[1;33myes\033[0m/\033[1;33mno\033[0m):"
echo -e "This function will protect hacktestkit with login and password!"
echo -e "So without thinking protect hacktestkit now!"
echo -e "Only use 'yes' for the best way!"
read -e -p $'(\033[4;93mprotect\033[0m\en)> ' WQE


if [[ "$WQE" = "no" ]]
then
clear
	echo -e "OK..."
	sleep 1
	echo -e "To protect hacktestkit, run '"$YS"epasswd"$CE"'"
	touch /etc/hacktestkit/login
        touch /etc/hacktestkit/password
        sleep 3
	clear
fi

if [[ "$WQE" = "yes" ]]
then
if [[ -f /etc/hacktestkit/login ]]
then
sleep 0
else
clear
printf '\033]2;hacktestkit password changer\a'
sleep 3
echo -e "Set hacktestkit login and password!"
echo -e "hacktestkit Password Protection:"

sleep 0.5
read -e -p $'(\033[4;93m(new)login\033[0m\en)> ' logins
while [ "$logins" = "root" ]
do
sleep 0.5
echo -e "["$RS"*"$CE"] "$RS"This user is reserved by the hacktestkit system!"$CE""
sleep 0.5
read -e -p $'(\033[4;93m(new)login\033[0m\en)> ' logins
done

echo $logins >> /etc/hacktestkit/login

sleep 0.5
read -s -p $'(\033[4;93m(new)password\033[0m\en)> ' passwords

echo $passwords >> /etc/hacktestkit/password

cd /root/hacktestkit/lib
chmod +x liblogin
./liblogin

cd /root/hacktestkit/lib
chmod +x libchattr
./libchattr

echo -e
echo -e

printf '\033]2;Configuring...\a'

function ProgressBar {

    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done

    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

                         
        
printf "\rConfiguring: [${_fill// /\#}${_empty// /-}] ${_progress}%%"

}


_start=1

_end=100

for number in $(seq ${_start} ${_end})
do
    sleep 0.2
    ProgressBar ${number} ${_end}
done

sleep 5
fi
fi

clear
printf '\033]2;create config key\a'
sleep 3
echo -e "Create your hacktestkit config key for "$YS"/etc/hacktestkit/.config"$CE""
echo -e "The hacktestkit config key is intended to protect hacktestkit boot!"
echo -e "It is recommended to create a strong hacktestkit config key!"
read -e -p $'(\033[4;93mconfig_key\033[0m\en)> ' DADI
if [[ "$DADI" = "" ]]
then
sleep 0
else
{
rm /root/hacktestkit/etc/.config
} &> /dev/null
echo $DADI >> /root/hacktestkit/etc/.config
fi

cd /root/hacktestkit/lib
chmod +x libconf
./libconf

if [[ "$(cat /etc/hacktestkit/login)" = "" ]]
then
sleep 0
else
cd /root/hacktestkit/lib
chmod +x libenc
./libenc
fi

clear
printf '\033]2;install.sh\a'
sleep 3
echo -e "Do you want to create hacktestkit application(\033[1;33myes\033[0m/\033[1;33mno\033[0m):"
echo -e "This will allow you to run hacktestkit via the application!"
echo -e "hacktestkit application will be created in the applications!"
read -e -p $'(\033[4;93mcreate\033[0m\en)> ' ES

if [[ "$ES" = "yes" ]]
then
cp /root/hacktestkit/app/hacktestkit.desktop /usr/share/applications
chmod +x /usr/share/applications/hacktestkit.desktop
fi

if [[ "$ES" = "no" ]]
then
clear
	echo -e "OK..."
	sleep 1
	echo -e "To create hacktestkit application, run '"$YS"ehtapp -c"$CE"'"
        sleep 3
fi

clear
printf '\033]2;install.sh\a'
sleep 3
echo -e "Open a NEW terminal and type '"$YS"hacktestkit"$CE"' to launch the framework"
sleep 0.5
echo -e "If you want to configure hacktestkit application, run '"$YS"ehtapp"$CE"'"
sleep 0.5
echo -e "If you want to configure hacktestkit modules, run '"$YS"ehtmod"$CE"'"
sleep 0.5
echo -e "If you want to change hacktestkit password, run '"$YS"epasswd"$CE"'"
sleep 1
exit
