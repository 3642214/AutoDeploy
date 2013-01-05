#!/bin/bash
. conf_path
PATH=$PATH:/root/git/shell/basic
[ $# = 1 ] || { "run parameter error: no parameter";exit -8; } 
		softName=`bash nameToPath.sh $1` || exit $?
		cd $softPath
		if [ $1 = "ZK" -a $1 = "zk" ]
			then		
				screen -S ZK -dm ./$installPath/$softName/bin/zkServer.sh start
			else
				screen -S $softName -dm ./$installPath/$softName/bin/$softName console
				[ $? = "0" ] || { echo "run $softName error";exit -9; }
				 	bash writeState.sh $softName || exit $?
		fi