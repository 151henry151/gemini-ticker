#!/bin/bash

gprice="https://api.gemini.com/v1/pubticker/btcusd"
tput civis
red=$(tput setaf 1)
green=$(tput setaf 2)
cyan=$(tput setaf 6)
while true; do

	read last < <(curl "$gprice" 2> /dev/null | jshon -e last) 
	cmp=${last//[\".]} 
	if (( prev == cmp ))  
	then printf %s "$cyan"  
	elif (( prev < cmp ))  
	then printf %s "$green"
	else printf %s "$red"; 
	fi 
	clear
	printf "BTCUSD:\\n"
	printf "${last//\"/}"
	sleep 3 
        prev=$cmp	
	
done
