#!/bin/bash
PATH=$PATH:/root/git/shell/basic
. conf_path
[ -n "$1" ] || { log "analyzeJob parameter error:no parameter";exit 253; }
 	job=`grep $1 $jobTable` || { log "$1 not found JOB" ;exit 233; }
		for j in $job
			{
 				echo $j | cut -d"=" -f 2 | sed 's/\// /g'
			}
