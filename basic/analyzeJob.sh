#!/bin/bash
. conf_path
[ -n "$1" ] || { log "analyzeJob parameter error:no parameter";exit 253; }
 		job=`grep $1 $jobTable` || exit $?
 		echo $job | cut -d"=" -f 2 | sed 's/\// /g' | cut -d"_" -f 1