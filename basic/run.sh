#!/bin/bash
. conf_path
PATH=$PATH:/root/git/shell/basic
[ $# = 1 ] || { "run parameter error: no parameter";exit -8; } 
		softName=`bash nameToPath.sh $1` || exit $?
		cd $installPath/$softName/bin/
		if [ $1 = "ZK" -o $1 = "zk" ]
			then			
				screen -S ZK -dm ./zkServer.sh start
			else
				screen -S $softName -dm ./$softName console
				[ $? = "0" ] || { echo "run $softName error";exit -9; }
				 	bash writeState.sh $softName || exit $?
		fi