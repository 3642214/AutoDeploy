#!/bin/bash
. conf_path
[ -d $unzipPath ] || mkdir -p $unzipPath
unzipFile.sh $1 || exit $?
cd $unzipPath
mv * ../
rm -fr $unzipPath
softName=`nameToPath.sh $1` || exit $?
#copy default config file
rm -fr $installPath/$softName/etc/*
cp -r git/$1/config/default/* $installPath/$softName/etc/
#special config
for shell in `ls -1 git/$1/config/special/`
	{ 
		bash $shell || exit $?
	}