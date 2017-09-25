#!/bin/bash

gprice="https://api.gemini.com/v1/pubticker/btcusd"
gethprice="https://api.gemini.com/v1/pubticker/ethusd"
tput bold
tput civis
tput bold
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
	printf "Gemini BTCUSD:\\n"
	printf "\$""${last//\"/}"
	printf "\n"
	read last < <(curl "$gethprice" 2> /dev/null | jshon -e last)
	cmp2=${last//[\".]}
	if (( prev2 == cmp2 ))
	then printf %s "$cyan"
	elif (( prev2 < cmp2 ))
	then printf %s "$green"
	else printf %s "$red";
	fi
	printf "Gemini ETHUSD:\\n"
	printf "\$""${last//\"/}"	
	sleep 3 
	clear
	prev2=$cmp2
        prev=$cmp	
	
done
