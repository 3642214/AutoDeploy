#!/bin/bash
PATH=$PATH:/root/git/shell/basic
. conf_path
[ -n "$1" ] || { log "readConfig parameter error:no parameter";exit 249; }
	value=`grep "^$1=" $stateFileName` || exit $?
		 echo $value | cut -d"=" -f 2 