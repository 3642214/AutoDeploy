#!/bin/bash
[ -n "$1" ] || { echo "git_pull parameter error";exit -1; }
softName=`nameToPath.sh $1`
if [ -d /root/final/$1/.git ]
	then
		cd /root/final/$1
		git pull
	esle
		git clone root@192.168.8.209:/root/git/final/$1
fi