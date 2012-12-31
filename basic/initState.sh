#!/bin/bash
#clear the config file
[ -f $stateFileName ] || touch $stateFileName
echo "soft=" >> $stateFileName
echo "git=" >> $stateFileName
echo "date=" >> $stateFileName