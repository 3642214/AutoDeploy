#!/bin/bash
stateFileName=/home/testuser/State
[ -n "$1" ] || { echo "readConfig parameter error";exit -1; }
		grep $1 $stateFileName |cut -d"=" -f 2 