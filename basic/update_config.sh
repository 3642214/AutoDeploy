#!/bin/bash
. conf_path
[ -n "$1" ] || { echo "update_config parameter error:no parameter";exit -13; }
softName=`bash nameToPath.sh $1` || exit $?
[ -d $installPath/$softName/etc ] || { echo "not found etc file";exit -14; }
	if [ $1 = "zk" -o $1 = "ZK" ]
	then
		rm -fr $installPath/$softName/conf/*
		cp -r /root/git/shell/$1/config/default/* $installPath/$softName/conf/ || { echo "cp ZK default config error";exit -18; }
	else
		#copy default config file
		rm -fr $installPath/$softName/etc/*
		cp -r /root/git/shell/$1/config/default/* $installPath/$softName/etc/ || { echo "cp default config error";exit -19; }
		#special config
		find /root/git/shell/$1/config/special/* || exit 0
		for shell in `find /root/git/shell/$1/config/special/*`
			{ 
				bash $shell || exit $?
			}
	fi