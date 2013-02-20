#!/bin/bash
#clear the config file
. conf_path
[ -f $stateFileName ] || touch $stateFileName || { log "StateFile error";exit 252; }
echo "soft=" >> $stateFileName
echo "git=" >> $stateFileName
echo "date=" >> $stateFileName