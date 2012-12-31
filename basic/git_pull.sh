#!/bin/bash
[ -n "$1" ] || { echo "git_pull parameter error:no parameter";exit -1; }
softName=`bash nameToPath.sh $1` || exit $?
[ -d /root/git/$1/.git ] || { mkdir -p /root/git;cd /root/git;git clone root@192.168.8.209:/root/git/final/$1; }
	cd /root/git/$1
	git pull || exit -3