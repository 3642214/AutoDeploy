#!/bin/bash
SNPath=/home/testuser/workspace/skyFs-storage
Name=`hostname | cut -d"." -f 1`
KVFile=/root/git/shell/KV
Rack=`grep $Name $KVFile | cut -d"<" -f 1` || { echo "not found KVFile" ; exit 193 ; }
[ -d $SNPath/releases ] || { echo "not found releases folder" ; exit 190 ; }
floder=`ls -l $SNPath/releases | grep ^d | awk '{print $9}' | sort -nr | sed -n 1p`
appFile=$SNPath/releases/$floder/sys.config
[ -f $appFile ] || { echo "$appFile not Found";exit 192; }
	Ip=`ip -f inet addr | grep global | awk '{print $2}' | awk -F/ '{print $1}'|cut -d'.' -f4`
	sed -i 's/{path,.*}/{path,\"\/root\/'$Rack'\/storage'$Ip'\"}/g' $appFile
