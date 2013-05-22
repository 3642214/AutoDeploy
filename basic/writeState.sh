#!/bin/bash
PATH=$PATH:/root/git/shell/basic
. conf_path
[ -n "$1" ] || { log "writeState parameter error:no parameter";exit 239; }
	[ grep "\[$1\]" $stateFileName ] || bash initStateValue.sh $1 || exit $?
		#CLT_Master to CLT
		floder=`echo $1 | cut -d"_" -f 1`
		cd $gitPath/$floder
		gitVersion=`git log|grep commit|sed -n 1p|cut -d" " -f 2`
		bash ini.sh $1 git $gitVersion
		date=`date`
		bash ini.sh $1 date "$date"