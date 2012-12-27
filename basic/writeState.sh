#!/bin/bash
stateFileName=/home/testuser/State
[ -n "$1" ] || { echo "writeState parameter error:no parameter";exit -1; }
		sed -i 's/^soft=.*$/soft='$1'/g' $stateFileName
		gitVersion=`git log|grep commit|sed -n 1p|cut -d" " -f 2`
		sed -i "s/^git=.*$/git=$gitVersion/g" $stateFileName 
		date=`date`
		sed -i "s/^date=.*$/date=$date/g" $stateFileName 
