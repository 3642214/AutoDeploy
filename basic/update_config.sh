#!/bin/bash
PATH=$PATH:/root/git/shell/basic
. conf_path
[ -n "$1" ] || { log "update_config parameter error:no parameter";exit 243; }
softName=`bash nameToPath.sh $1` || exit $?
#kill process
pkill -f $softName/erts.*/bin/beam.smp
#config
if [ $1 = "CLT_Master" -o $1 = "CLT_Snode" -o $1 = "SMTSDVR" ]
	then
		bash etcSetConfig.sh $1 || exit $?
	else
	  bash setConfig.sh $1 || exit $? 
fi