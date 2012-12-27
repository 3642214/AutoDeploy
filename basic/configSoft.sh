#!/bin/bash
INSTALL="/home/testuser/workspace"
unzipPath="/home/testuser/workspace/tmp/"
unzipFile.sh $1
cd $unzipPath
mv * ../
rm -fr $unzipPath
softName=`nameToPath.sh $1` || exit $?
#copy default config file
rm -fr $INSTALL/$softName/etc/*
cp git/$1/config/default/* $INSTALL/$softName/etc/
#special config
for shell in `ls -1 git/$1/config/special/`
	{ 
		bash $shell || exit $?
	}