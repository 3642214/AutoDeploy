#!/bin/bash
#clear the config file
PATH=$PATH:/root/git/shell/basic
. conf_path
[ -n "$1" ] || { log "initStateValue parameter error:no parameter";exit 226; }
	echo "[$1]" >> $stateFileName
	echo "time=" >> $stateFileName
	echo "git=" >> $stateFileName