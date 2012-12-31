#!/bin/bash
. conf_path
[ -d $unzipPath ] || mkdir -p $unzipPath
bash unzipFile.sh $1 || exit $?
cd $unzipPath
mv -f * ../
rm -fr $unzipPath
softName=`bash nameToPath.sh $1` || exit $?
#copy default config file
rm -fr $installPath/$softName/etc/*
cp -r /root/git/$1/config/default/* $installPath/$softName/etc/
#special config
for shell in `ls -1 git/$1/config/special/`
	{ 
		bash $shell || exit $?
	}