#!/bin/bash
. conf_path
[ $# = 1 ] || { log "isSoftRunning parameter error";exit 232; }
case "$1" in
	CN){ target="ZK" ; port=2181; };;
	SN){ target="CN" ; port=29009; };;
	CLT_Snode){ target="CLT_Master" ; port=30001; };;
	CLT_Master) exit 0;;	
	*)echo " $0 -- clear paremeter error";exit 137;;
esac
	ips=`bash jobWhoDo.sh $target`
for ip in $ips
	{	
		(sleep 1;echo logout)|telnet $ip".perftest.sdfs" $port > temp.txt || [ $? = 1 ] || { log "telnet error" ; rm -fr temp.txt ; exit 228; } 
		cou=`grep -c Connected temp.txt`
		if [ $cou -gt 0 ]
			then
				echo 0		#true
			else
				
				echo 1		#false
		fi
		rm -fr temp.txt
	}
