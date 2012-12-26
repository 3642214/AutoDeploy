#!/bin/bash
softPath=/home/testuser/workspace
softName=
[ $# = 1 ] || { "run parameter error";exit -1; } 
		softName=`nameToPath.sh $1`
		cd $softPath
		if [ $1 = "ZK" or $1 = "zk"]
			then		
				screen -S ZK -dm ./$softName/bin/zkServer.sh start
			else
				screen -S $softName -dm ./$softName/bin/$softName console
				[ $? = "0" ] || { echo "run $softName error";exit -1; }
				 		writeLog.sh $softName
		fi