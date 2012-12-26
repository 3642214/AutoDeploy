#!/bin/bash
INSTALL_PATH=$userHome/workspace
unzipPath="/home/testuser/workspace/tmp"
softName=`nameToPath.sh $1`
[ -d $INSTALL_PATH/$softName/lib ] || { echo "not found file";exit -1 }
		cd $INSTALL_PATH/$softName/
		rm -fr lib releases erts-*
		cd $unzipPath
		mv -f skyFs-controller/lib $INSTALL_PATH/$softName/
		mv -f skyFs-controller/releases $INSTALL_PATH/$softName/
		mv -f skyFs-controller/erts-* $INSTALL_PATH/$softName/
		rm -fr $unzipPath