#!/bin/bash
SNPath=/home/testuser/workspace/skyFs-storage
[ -d $SNPath/releases ] || { echo "not found releases folder" ; exit 190 ; }
floder=`ls -l $SNPath/releases | grep ^d | awk '{print $9}' | sort -nr | sed -n 1p`
appFile=$SNPath/releases/$floder/sys.config
[ -f $appFile ] || { echo "$appFile not Found";exit 192; }
	devCount=`df |wc -l`
	diskSize=0
	allDiskSize=0
	for((i=2,j=0;i<=$devCount;i++))
	do
	  diskSize=`df|awk '{print $2}'|sed -n "${i}p"`
	  diskSize=$(( diskSize / 1000 / 1000 ))
	  if [ $diskSize -lt "200" ] ;then
	  		allDiskSize=$(( allDiskSize + 0 ))
	 	elif [ $diskSize -lt "1000" ] ;then
	 			allDiskSize=$(( allDiskSize + 10 ))
	 	elif [ $diskSize -lt "1500" ] ;then
	 			allDiskSize=$(( allDiskSize + 15 ))
	 	elif [ $diskSize -lt "2000" ] ;then
	 			allDiskSize=$(( allDiskSize + 20 ))
	 	fi	 			
	done
	rate=$(( 100 / allDiskSize ))
	sed -i "s/{write_rate,.*},/{write_rate,$rate},/g" $appFile