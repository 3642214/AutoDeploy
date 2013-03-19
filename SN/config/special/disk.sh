#!/bin/bash
SNPath=/home/testuser/workspace/skyFs-storage
[ -d $SNPath/releases ] || { echo "not found releases folder" ; exit 190 ; }
floder=`ls -l $SNPath/releases | grep ^d | awk '{print $9}' | sort -nr | sed -n 1p`
appFile=$SNPath/releases/$floder/sys.config
[ -f $appFile ] || { echo "$appFile not Found";exit 192; }
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
	sed -i "s/{vol,.*}/{vol,[$allVolPath]}/g" $appFile
	sed -i "s/{devices,.*}/{devices,[$allDevPath]}/g" $appFile