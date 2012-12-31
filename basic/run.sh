#!/bin/bash
. conf_path
[ $# = 1 ] || { "run parameter error";exit -1; } 
		softName=`bash nameToPath.sh $1` || exit $?
		cd $softPath
		if [ $1 = "ZK" -a $1 = "zk" ]
			then		
				screen -S ZK -dm ./$installPath/bin/zkServer.sh start
			else
				screen -S $softName -dm ./$installPath/bin/$softName console
				[ $? = "0" ] || { echo "run $softName error";exit -1; }
				 	writeState.sh $softName || exit $?
		fi