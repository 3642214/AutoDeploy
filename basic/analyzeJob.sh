#!/bin/bash
jobTable=/home/testuser/git
[ -n "$1" ] || { echo "analyzeJob parameter error";exit -1; }
 		job=grep $1 $jobTable |cut -d"=" -f 2|sed 's/=/ /g'
 		echo job