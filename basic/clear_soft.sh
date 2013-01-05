#!/bin/bash
. conf_path
PATH=$PATH:/root/git/shell/basic
[ -n "$1" ] || { echo "clear_soft parameter error:no parameter";exit -20; }
softName=`bash nameToPath.sh $1` || exit $?
rm -fr $installPath/$softName $stateFileName