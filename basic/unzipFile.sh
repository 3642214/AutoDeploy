#!/bin/bash
unzipPath="/home/testuser/workspace/tmp/"
[ -z "$1" ] || { echo "unzip parameter error";exit -1; }
		cd git/Final/$1/
		unzip -q *.zip -d $unzipPath