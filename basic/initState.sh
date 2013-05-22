#!/bin/bash
#clear the config file
PATH=$PATH:/root/git/shell/basic
. conf_path
[ -f $stateFileName ] || touch $stateFileName || { log "StateFile error";exit 252; }