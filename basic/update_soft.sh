#!/bin/bash
PATH=$PATH:/root/git/shell/basic
. conf_path
[ -n "$1" ] || { log "update_soft parameter error:no parameter";exit 241; }
softName=`bash nameToPath.sh $1` || exit $?
[ -d $installPath/$softName/lib ] || { log "not found lib file";exit 240; }
		[ -d $unzipPath ] || mkdir -p $unzipPath
		bash unzipFile.sh $1 || exit $?
		#kill process
		pkill -f $softName/erts.*/bin/beam.smp
		#delete old path
		if [ $1 = "CLT_Snode" -o $1 = "CLT_Master" -o $1 = "RTSP" ]
			then
				cd $installPath/$softName/
					mv -f etc/app.config ./
					mv -f etc/vm.args ./
					rm -fr lib releases erts-*
				cd $unzipPath
					mv -f $softName/lib $installPath/$softName/
					mv -f $softName/releases $installPath/$softName/
					mv -f $softName/erts-* $installPath/$softName/
					rm -fr $unzipPath
				cd $installPath/$softName/
					mv -f app.config $installPath/$softName/etc/
					mv -f vm.args $installPath/$softName/etc/
		elif [ $1 != ZK ]
			then
				cd $installPath/$softName/
					versionFloder=`ls -l $installPath/$softName/releases | grep ^d | awk '{print $9}' | sort -nr | sed -n 1p`
					mv -f releases/$versionFloder/sys.config ./
					mv -f releases/$versionFloder/vm.args ./
					rm -fr lib releases erts-*
				cd $unzipPath
					mv -f $softName/lib $installPath/$softName/
					mv -f $softName/releases $installPath/$softName/
					mv -f $softName/erts-* $installPath/$softName/
					rm -fr $unzipPath
				cd $installPath/$softName/
					versionFloder=`ls -l $installPath/$softName/releases | grep ^d | awk '{print $9}' | sort -nr | sed -n 1p`
					mv -f sys.config $installPath/$softName/releases/$versionFloder/
					mv -f vm.args $installPath/$softName/releases/$versionFloder
		fi