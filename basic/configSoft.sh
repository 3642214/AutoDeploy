#!/bin/bash
. conf_path
[ -d $unzipPath ] || mkdir -p $unzipPath
softName=`bash nameToPath.sh $1` || exit $?
bash unzipFile.sh $1 || exit $?
cd $unzipPath
rm -fr ../$softName
mv -f * ../
cd ../
rm -fr $unzipPath
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
	  shells=`find /root/git/shell/$1/config/special/*` || exit 0
		for shell in 
			{ 
				bash $shell || exit $?
			}
fi