#!/bin/bash
. conf_path
[ -n "$1" ] || { echo "readConfig parameter error:no parameter";exit -1; }
	value=`grep "^$1=" $stateFileName` || exit $?
		 echo $value | cut -d"=" -f 2 