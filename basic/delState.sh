#!/bin/bash
PATH=$PATH:/root/git/shell/basic
. conf_path
[ -n "$1" ] || { log "delConfig parameter error:no parameter";exit 224; }
sed -i /$1/,+2d $stateFileName || exit $?
