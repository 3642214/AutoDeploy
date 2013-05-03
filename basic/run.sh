#!/bin/bash
PATH=$PATH:/root/git/shell/basic
. conf_path
. /etc/profile
PATH=$PATH:/root/git/shell/basic
[ $# = 1 ] || { log "run parameter error: no parameter";exit 248; } 
		softName=`bash nameToPath.sh $1` || exit $?
		cd $installPath/$softName/bin/
		if [ $1 = "ZK" -o $1 = "zk" ]
			then			
				./zkServer.sh start
			else
			i=0
			result=`bash isSoftRunning.sh $1` || exit $?
			  while [ $result -ne 0 ]  #判断ZK、CN、Master是否在运行
			  	do
					echo i=$i
			  		(( i = i + 1 ))
			  		[ $i -lt $telnetTimeout ] || { log "$1 soft was not Runing";exit 231; }  #每秒判断一次
			  		sleep 1
					result=`bash isSoftRunning.sh $1`
			  	done	
				screen -S $1 -dm ./$softName console
				[ $? = "0" ] || { log "run $softName error";exit 247; }
				 	bash writeState.sh $1 || exit $?
		fi
