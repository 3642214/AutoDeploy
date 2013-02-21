#!/bin/bash
. conf_path
PATH=$PATH:/root/git/shell/basic
[ -n "$1" ] || { log "update_soft parameter error:no parameter";exit 241; }
softName=`bash nameToPath.sh $1` || exit $?
[ -d $installPath/$softName/lib ] || { log "not found lib file";exit 240; }
		[ -d $unzipPath ] || mkdir -p $unzipPath
		bash unzipFile.sh $1 || exit $?
		#kill process
		pkill -f $softName/erts.*/bin/beam.smp
		#delete old path
		cd $installPath/$softName/
		rm -fr lib releases erts-*
		cd $unzipPath
		mv -f skyFs-controller/lib $installPath/$softName/
		mv -f skyFs-controller/releases $installPath/$softName/
		mv -f skyFs-controller/erts-* $installPath/$softName/
		rm -fr $unzipPath
