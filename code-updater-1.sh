#!/usr/bin/env bash

# Auto: Rodrigo Rocha
# Date: Sun/12/Sep 2021
# Goal:
# Automate the task of updating the (stable) debian system, making the user free for other activities.
# The code below is intended for users who use debian in its stable version.
# Tips and improvements are welcome. The central idea is to make the user spend less time watching the system being updated.

# variables:

_int="WE HAVE INTERNET"
_up="UPDATE"
_upg="UPGRADE -Y"
_full="FULL-UPGRADE -Y"

clear

if ping -c4 8.8.8.8 2>/dev/null;
then
clear
echo "###...${_int}...###"
sleep 4s
else
echo "###...NO ${_int}...###"
sleep 4s
exit
fi

if apt update;
then
echo "###...SUCCESS IN ${_up}...###"
sleep 4s
else
echo "###...ERROR IN ${_up} ...###"
sleep 4s
exit
fi

if apt upgrade -y;
then
echo "###...SUCCESS IN ${_upg} ...###"
sleep 4s
else
echo "###...ERROR IN ${_upg} ...###"
sleep 4s
exit
fi
echo ""
clear
echo "###...CLEANING THE SYSTEM...###"
sleep 4s

sudo apt autoremove -y ; sudo apt autoclean
clear
echo "###...FULL UPGRADE ...###"
sleep 4s

if sudo apt full-upgrade -y;
then
echo "###...${_full} SUCCESSFULLY MADE ...###"
sleep
else
echo "###...ERROR ${_full} ...###"
sleep 4s
exit
exit