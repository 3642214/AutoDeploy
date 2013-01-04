#!/bin/bash
. conf_path
[ -n "$1" ] || { echo "unzip parameter error:no parameter";exit -10; }
	cd /root/git/$1/
	if [ $1 = "zk" -o $1 = "ZK" ]
		then
			tar zxf zookeeper-3.3.3.tar.gz -C $unzipPath || { echo "tar error";exit -11; }
		else 
			unzip -q *.zip -d $unzipPath || { echo "unzip error";exit -12; }
	fi