#!/bin/bash
. conf_path
[ -n "$1" ] || { log "update_config parameter error:no parameter";exit 243; }
softName=`bash nameToPath.sh $1` || exit $?
#kill process
pkill -f $softName/erts.*/bin/beam.smp
#config
bash setConfig.sh $1 || exit $?