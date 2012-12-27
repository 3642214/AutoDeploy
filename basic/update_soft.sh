#!/bin/bash
INSTALL_PATH=/home/testuser/workspace
unzipPath="/home/testuser/workspace/tmp"
[ -n "$1" ] || { echo "update_soft parameter error:no parameter";exit -1; }
softName=`bash nameToPath.sh $1` || exit $?
[ -d $INSTALL_PATH/$softName/lib ] || { echo "not found file";exit -1 }
		cd $INSTALL_PATH/$softName/
		rm -fr lib releases erts-*
		cd $unzipPath
		mv -f skyFs-controller/lib $INSTALL_PATH/$softName/
		mv -f skyFs-controller/releases $INSTALL_PATH/$softName/
		mv -f skyFs-controller/erts-* $INSTALL_PATH/$softName/
		rm -fr $unzipPath
