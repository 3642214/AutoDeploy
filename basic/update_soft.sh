#!/bin/bash
. conf_path
[ -n "$1" ] || { echo "update_soft parameter error:no parameter";exit -15; }
softName=`bash nameToPath.sh $1` || exit $?
[ -d $installPath/$softName/lib ] || { echo "not found lib file";exit -16; }
		cd $installPath/$softName/
		rm -fr lib releases erts-*
		cd $unzipPath
		mv -f skyFs-controller/lib $installPath/$softName/
		mv -f skyFs-controller/releases $installPath/$softName/
		mv -f skyFs-controller/erts-* $installPath/$softName/
		rm -fr $unzipPath
