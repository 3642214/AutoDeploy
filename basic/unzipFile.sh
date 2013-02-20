#!/bin/bash
. conf_path
[ -n "$1" ] || { log "unzip parameter error:no parameter";exit 246; }
	cd /root/git/$1/
	if [ $1 = "zk" -o $1 = "ZK" ]
		then
			tar zxf zookeeper-3.3.3.tar.gz -C $unzipPath || { log "tar error";exit 245; }
		else 
			unzip -q *.zip -d $unzipPath || { log "unzip error";exit 244; }
	fi