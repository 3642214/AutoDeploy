#!/bin/bash
. conf_path
[ -n "$1" ] || { echo "unzip parameter error:no parameter";exit -1; }
		cd /root/git/$1/
	unzip -q *.zip -d $unzipPath || { echo "unzip error";exit -1; }