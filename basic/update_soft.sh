#!/bin/bash
. conf_path
[ -n "$1" ] || { echo "update_soft parameter error:no parameter";exit -1; }
softName=`bash nameToPath.sh $1` || exit $?
[ -d $installPath/$softName/lib ] || { echo "not found file";exit -1 }
		cd $installPath/$softName/
		rm -fr lib releases erts-*
		cd $unzipPath
		mv -f skyFs-controller/lib $installPath/$softName/
		mv -f skyFs-controller/releases $installPath/$softName/
		mv -f skyFs-controller/erts-* $installPath/$softName/
		rm -fr $unzipPath
