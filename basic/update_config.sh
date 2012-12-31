#!/bin/bash
. conf_path
[ -n "$1" ] || { echo "update_config parameter error:no parameter";exit -1; }
softName=`bash nameToPath.sh $1` || exit $?
[ -d $installPath/$softName/etc ] || { echo "not found file";exit -1; }
		rm -fr $installPath/$softName/etc/*
		#copy default config file
		cp git/$1/config/default/* $installPath/$softName/etc/
		#special config
		for shell in `ls -1 git/$1/config/special/`
		{ 
		  bash $shell || exit $?
		}
