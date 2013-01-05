#!/bin/bash
. conf_path
[ -n "$1" ] || { echo "git_pull parameter error:no parameter";exit -1; }
softName=`bash nameToPath.sh $1` || exit $?
[ -d $gitPath/$1/.git ] || { mkdir -p $gitPath;cd $gitPath;git clone $gitServerAddr/$1; }
	cd $gitPath/$1
	git pull || { echo "git_pull error";exit -2; }