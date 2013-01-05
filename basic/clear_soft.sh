#!/bin/bash
. conf_path
PATH=$PATH:/root/git/shell/basic
	[ -f $stateFileName ] || { echo "not found stateFile";exit -20; };
	job=`bash readState.sh soft` || { echo "readState error";exit -21; }
	softName=`bash nameToPath.sh $1` || exit $?
	rm -fr $installPath/$softName $stateFileName