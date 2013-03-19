#!/bin/bash
SNPath=/home/testuser/workspace/skyFs-storage
[ -d $SNPath/releases ] || { echo "not found releases folder" ; exit 190 ; }
floder=`ls -l $SNPath/releases | grep ^d | awk '{print $9}' | sort -nr | sed -n 1p`
appFile=$SNPath/releases/$floder/sys.config
[ -f $appFile ] || { echo "$appFile not Found";exit 192; }
	rack=`ip -f inet addr | grep global | awk '{print $2}' | awk -F/ '{print $1}'|cut -d'.' -f4`
	sed -i 's/{path,.*}/{path,\"\/root\/rack\/storage'$rack'\"}/g' $appFile
