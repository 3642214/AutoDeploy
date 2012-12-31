#!/bin/bash
#clear the config file
. conf_path
[ -f $stateFileName ] || touch $stateFileName || { echo "StateFile error";exit -4; }
echo "soft=" >> $stateFileName
echo "git=" >> $stateFileName
echo "date=" >> $stateFileName