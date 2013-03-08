#!/bin/bash
. conf_path
[ -n "$1" ] || { log "jobWhoDo parameter error:no parameter";exit 230; }
 	who=`grep $1 $jobTable` || { log "$1 not found Who" ;exit 229; }
 		echo $who | cut -d"=" -f 1 | sed 's/\\/ /g'