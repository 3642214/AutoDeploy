#!/bin/bash
appFile=/home/testuser/workspace/skyFs-storage/etc/app.config
[ -f $appFile ] || { echo "$appFile can not Found";exit -1; }
	devCount=`df |wc -l`
	devSize=
	devPath=
	volPath=
	allDevPath=
	allVolPath=
	for((i=2,j=0;i<=$devCount;i++))
	do
	  devSize=`df|awk '{print $2}'|sed -n "${i}p"`
	  SIZE=$(( 200 * 1024 * 1024 ))
	  if [ $devSize -gt $SIZE ]
	    then
	      devPath=`df|awk '{print $1}'|sed -n "${i}p"`
	      volPath=`df|awk '{print $6}'|sed -n "${i}p"`
	      if [ $j -gt 0 ] 
	        then
	          devPath=',"'$devPath'"'
	          volPath=',"'$volPath'"'
	        else
	          devPath='"'$devPath'"'
	          volPath='"'$volPath'"'
	      fi
	    allDevPath=$allDevPath$devPath
	    allVolPath=$allVolPath$volPath
	    (( j = j +1 ))
	  fi
	done
	#Escape Character: " to \"   / to \/
	allVolPath="$(echo $allVolPath | sed 's/\//\\\//g' | sed 's/"/\\\"/g')"
	allDevPath="$(echo $allDevPath | sed 's/\//\\\//g' | sed 's/"/\\\"/g')"
	sed -i "s/{vol,.*}/{vol,[$allVolPath]}/g" $appconfigFile
	sed -i "s/{devices,.*}/{devices,[$allDevPath]}/g" $appconfigFile