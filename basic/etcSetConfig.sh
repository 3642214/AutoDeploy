#!/bin/bash
. conf_path
softName=`bash nameToPath.sh $1` || exit $?
[ -d $installPath/$softName/etc ] || { log "not found releases file";exit 242; }
if [ $1 = "zk" -o $1 = "ZK" ]
then
	rm -fr $installPath/$softName/conf/*
	cp -r /root/git/shell/$1/config/default/* $installPath/$softName/conf/ || { log "cp ZK default config error";exit 238; }
else
	#delete old config file
	rm -fr $installPath/$softName/etc/*
	#CLT_Master to CLT/Master
	folder=`echo $1 | sed 's/_/\//g'`
	#copy default config file
	cp -r /root/git/shell/$folder/config/default/* $installPath/$softName/etc/ || { log "cp default config error";exit 237; }
	#special config
	find /root/git/shell/$folder/config/special/* || exit 0
	for shell in `find /root/git/shell/$folder/config/special/*`
		{ 
			bash $shell etc || exit $?
		}
fi