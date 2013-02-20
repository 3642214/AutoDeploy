#!/bin/bash
. conf_path
PATH=$PATH:/root/git/shell/basic
[ $# = 1 ] || { log "run parameter error: no parameter";exit 248; } 
		softName=`bash nameToPath.sh $1` || exit $?
		cd $installPath/$softName/bin/
		if [ $1 = "ZK" -o $1 = "zk" ]
			then			
				./zkServer.sh start
			else
				screen -S $softName -dm ./$softName console
				[ $? = "0" ] || { log "run $softName error";exit 247; }
				 	bash writeState.sh $1 || exit $?
		fi