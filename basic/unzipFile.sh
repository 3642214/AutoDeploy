#!/bin/bash
. conf_path
[ -n "$1" ] || { log "unzip parameter error:no parameter";exit 246; }
	#CLT_Master to CLT
	folder=`echo $1 | cut -d"_" -f 1`
	cd /root/git/$folder
	if [ $1 = "zk" -o $1 = "ZK" ]
		then
			tar zxf zookeeper-*.tar.gz -C $unzipPath || { log "tar error";exit 245; }
		else 
			unzip -q *.zip -d $unzipPath || { log "unzip error";exit 244; }
	fi