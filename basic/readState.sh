#!/bin/bash
PATH=$PATH:/root/git/shell/basic
. conf_path
[ -n "$1" ] || { log "readConfig parameter error:no parameter";exit 249; }
if [ "$1" = "soft" ]
then
	value=`grep -o "\[.*\]" $stateFileName |sed 's/\[//g'|sed 's/\]//g'` || exit $?	 
fi
echo $value