#!/bin/bash
. conf_path
[ -d $unzipPath ] || mkdir -p $unzipPath
softName=`bash nameToPath.sh $1` || exit $?
bash unzipFile.sh $1 || exit $?
cd $unzipPath
rm -fr ../$softName
mv -f * ../
rm -fr $unzipPath
#copy default config file
rm -fr $installPath/$softName/etc/*
cp -r /root/git/shell/$1/config/default/* $installPath/$softName/etc/
#special config
for shell in `find /root/git/shell/$1/config/special/*`
	{ 
		bash $shell || exit $?
	}