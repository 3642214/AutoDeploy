#!/bin/bash
appFile=/home/testuser/workspace/skyFs-storage/etc/app.config
[ -f $appFile ] || echo "$appFile can not Found";exit -1
	rack=`ip -f inet addr | grep global | awk '{print $2}' | awk -F/ '{print $1}'|cut -d'.' -f4`
	{path,\"/root/rack/storage$storage\"},
	sed -i 's/{path,.*}/{path,\"\/root\/rack\/storage$rack\"}/g' $appConfigFile
