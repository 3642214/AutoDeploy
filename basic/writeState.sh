#!/bin/bash
. conf_path
[ -n "$1" ] || { echo "writeState parameter error:no parameter";exit -17; }
[ -f $stateFileName ] || bash initState.sh 
		sed -i 's/^soft=.*$/soft='$1'/g' $stateFileName
		cd $gitPath/$1
		gitVersion=`git log|grep commit|sed -n 1p|cut -d" " -f 2`
		sed -i "s/^git=.*$/git=$gitVersion/g" $stateFileName 
		date=`date`
		sed -i "s/^date=.*$/date=$date/g" $stateFileName 