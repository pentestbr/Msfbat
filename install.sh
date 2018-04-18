# Msfbat Installer
# A script that installs and sets up MSFBAT.
# 3.0
# Edvard Busck-Nielsen 2018

# Edvard Busck-Nelsen, hereby disclaims all copyright interest in the program “MSFBAT Installer” (which is a script that installs and sets up MSFBAT.  written by Edvard Busck-Nielsen.

# signature of Edvard Busck-Nelsen 18 April 2018
# Edvard Busck-Nielsen, @buscedv

# This file is part of MSFBAT

#    MSFBAT is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.

#    MSFBAT is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.

#    You should have received a copy of the GNU General Public License
#    along with MSFBAT.  If not, see <http://www.gnu.org/licenses/>

# Website: http://msfbat.ml
# Contact: Github(Personal), https://github.com/Buscedv


menu=$(cat menu/menu.txt)
menu1=$(cat menu/menu_1.txt)
clear

# installing necessary packages

# Informs the user

echo "\033[1m\033[0;32mInstalling Required Packages... Please enter your sudo password:"
echo "This Script will install: xterm, w3m, curl & hostname. You don't need to run this script if you already have them installed, Though it never hurts to make sure... ;)\033[0m\033[1;37m"
    
    sudo apt-get install xterm

    clear
    
    sudo apt-get install w3m
    
    clear

    sudo apt-get install curl

    clear

    sudo apt-get install hostname

    clear

    sudo apt-get install figlet

    clear

# Checks if user is using kali.

os=$(lsb_release -i | cut -f 2-)
if [ "$os" = "Kali" ]; then
	echo ""
else
	kali_check="no"
fi

clear

echo "" #Spacer Line.
echo "\033[1m\033[0;32m   [  Xterm   ] :    OK! ._._._._._._._._._._._._._."
echo "\033[1m\033[0;32m   [   W3M    ] :    OK! ._._._._._._._._._._._._._."
echo "\033[1m\033[0;32m   [   Curl   ] :    OK! ._._._._._._._._._._._._._."
echo "\033[1m\033[0;32m   [ Hostname ] :    OK! ._._._._._._._._._._._._._."
echo "\033[1m\033[0;32m   [  Figlet  ] :    OK! ._._._._._._._._._._._._._."
if [ "$kali_check" = !"no" ]; then
	echo "\033[1m\033[0;32m   [   Kali   ] :    OK! ._._._._._._._._._._._._._."
else
	echo "\033[1m\033[0;31m   [   Kali   ] :    NO! ._._._._._._._._._._._._._."
	echo ""
	echo "\033[1m\033[1;30m   You Are Not Running Kai-Linux! This Program May Not Function Properly! Be Aware..."
fi
echo ""
sml_bat=$(cat menu/small_bat.txt)
echo "\033[1m\033[0;32m"   "$sml_bat"
echo "\033[0m"
figlet    D O N E !
echo ""
echo "\033[1m\033[1;37m   The Installation Is Now Done! Press Enter To Start The Program..."
read rewd
sh msfbat.sh