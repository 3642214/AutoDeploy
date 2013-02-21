#!/bin/bash
. conf_path
[ -n "$1" ] || { log "update_config parameter error:no parameter";exit 243; }
softName=`bash nameToPath.sh $1` || exit $?
[ -d $installPath/$softName/etc ] || { log "not found etc file";exit 242; }
	#kill process
	pkill -f $softName/erts.*/bin/beam.smp
	if [ $1 = "zk" -o $1 = "ZK" ]
	then
		rm -fr $installPath/$softName/conf/*
		cp -r /root/git/shell/$1/config/default/* $installPath/$softName/conf/ || { log "cp ZK default config error";exit 238; }
	else
		#copy default config file
		rm -fr $installPath/$softName/etc/*
		cp -r /root/git/shell/$1/config/default/* $installPath/$softName/etc/ || { log "cp default config error";exit 237; }
		#special config
		find /root/git/shell/$1/config/special/* || exit 0
		for shell in `find /root/git/shell/$1/config/special/*`
			{ 
				bash $shell || exit $?
			}
	fi