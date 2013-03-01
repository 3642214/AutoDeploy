#!/bin/bash
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
			  while [ `bash isSoftRunning $1` -ne 0 ]  #判断ZK、CN、Master是否在运行
			  	do
			  		(( i = i + 1 ))
			  		[ $i -lt 30 ] || { log "$1 soft was not Runing";exit 231; }  #每秒判断一次，30次后报错
			  		sleep 1
			  	done	
				screen -S $1 -dm ./$softName console
				[ $? = "0" ] || { log "run $softName error";exit 247; }
				 	bash writeState.sh $1 || exit $?
		fi