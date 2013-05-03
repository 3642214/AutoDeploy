#!/bin/bash
PATH=$PATH:/root/git/shell/basic
. conf_path
[ -n "$1" ] || { log "restartSoft parameter error:no parameter";exit 227; }
softName=`bash nameToPath.sh $1` || exit $?
	#kill process
	pkill -f $softName/erts.*/bin/beam.smp
bash run.sh $1 || exit $?