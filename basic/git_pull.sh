#!/bin/bash
[ -n "$1" ] || { echo "git_pull parameter error:no parameter";exit -1; }
softName=`bash nameToPath.sh $1`
result=`echo $?`;[ $result = "0" ] || exit $result
if [ -d /root/final/$1/.git ]
	then
		cd /root/final/$1
		git pull
	else
		git clone root@192.168.8.209:/root/git/final/$1
fi