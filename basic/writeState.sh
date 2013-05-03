#!/bin/bash
PATH=$PATH:/root/git/shell/basic
. conf_path
[ -n "$1" ] || { log "writeState parameter error:no parameter";exit 239; }
[ -f $stateFileName ] || bash initState.sh 
		sed -i 's/^soft=.*$/soft='$1'/g' $stateFileName
		#CLT_Master to CLT
		floder=`echo $1 | cut -d"_" -f 1`
		cd $gitPath/$floder
		gitVersion=`git log|grep commit|sed -n 1p|cut -d" " -f 2`
		sed -i "s/^git=.*$/git=$gitVersion/g" $stateFileName 
		date=`date`
		sed -i "s/^date=.*$/date=$date/g" $stateFileName 