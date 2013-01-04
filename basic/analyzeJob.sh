#!/bin/bash
. conf_path
[ -n "$1" ] || { echo "analyzeJob parameter error:no parameter";exit -3; }
 		job=`grep $1 $jobTable` || exit $?
 		echo $job | cut -d"=" -f 2 | sed 's/\// /g'