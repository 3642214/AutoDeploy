#!/bin/bash
INSTALL_PATH=/home/testuser/workspace
softName=`nameToPath.sh $1`
[ -d $INSTALL_PATH/$softName/etc ] || { echo "not found file";exit -1; }
		rm -fr $INSTALL_PATH/$softName/etc/*
		#copy default config file
		cp git/$1/config/default/* $INSTALL/$softName/etc/
		#special config
		for shell in `ls -1 git/$1/config/special/`
		{ 
		  bash $shell || exit $?
		}