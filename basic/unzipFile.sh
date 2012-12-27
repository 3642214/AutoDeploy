#!/bin/bash
unzipPath="/home/testuser/workspace/tmp/"
[ -n "$1" ] || { echo "unzip parameter error:no parameter";exit -1; }
		cd git/Final/$1/
	unzip -q *.zip -d $unzipPath || { echo "unzip error";exit -1; }