#!/bin/bash
PATH=$PATH:/root/git/shell/basic
. conf_path
[ -f $stateFileName ] || { log "not found stateFile";exit 236; }
	jobs=`bash readState.sh soft` || { log "readState error";exit 235; }
for job in $jobs
	{
			softName=`bash nameToPath.sh $job` || exit $?
			[ -z $1 ]||[ $1 = $job ]||exit 0
			#kill process
			pkill -f $softName/erts.*/bin/beam.smp
			#delete file and Statefile
			rm -fr $installPath/$softName
			bash delState.sh $job || exit $?
		if [ $job = "ZK" ]
			then
				killall java
				rm -fr $installPath/zookeeper*
		fi
	}
