#!/bin/zsh

IP_ADDRESS=$(hostname -I)
IP_TRIM=${IP_ADDRESS%.*}

#echo $IP_ADDRESS

#create a new .txt
echo "" > $IP_TRIM.txt

#loop
#& is for run multiple thread
for ip in {1..254}
do 
	ping -c 1 $IP_TRIM.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":"  >> $IP_TRIM.txt &
done

cat $IP_TRIM.txt | sort > sorted_$IP_TRIM.txt

#perform scan
nmap -sS -iL sorted_$IP_TRIM.txt

exit
 
#sudo nmap -sn $IP_TRIM
