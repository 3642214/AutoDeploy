#!/bin/bash
. conf_path
softName=`bash nameToPath.sh $1` || exit $?
if [ $1 = "zk" -o $1 = "ZK" ]
then
	rm -fr $installPath/$softName/conf/*
	cp -r /root/git/shell/$1/config/default/* $installPath/$softName/conf/ || { log "cp ZK default config error";exit 238; }
else
	[ -d $installPath/$softName/releases ] || { log "not found releases file";exit 242; }
	versionFloder=`ls -l $installPath/$softName/releases | grep ^d | awk '{print $9}' | sort -nr | sed -n 1p`
	#delete old config file
	rm -fr $installPath/$softName/releases/$versionFloder/sys.config
	rm -fr $installPath/$softName/releases/$versionFloder/vm.args
	#CLT_Master to CLT/Master
	folder=`echo $1 | sed 's/_/\//g'`
	#copy default config file
	cp -r /root/git/shell/$folder/config/default/* $installPath/$softName/releases/$versionFloder/ || { log "cp default config error";exit 237; }
	#special config
	find /root/git/shell/$folder/config/special/* || exit 0
	for shell in `find /root/git/shell/$folder/config/special/*`
		{ 
			bash $shell || exit $?
		}
fi