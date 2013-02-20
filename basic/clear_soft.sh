#!/bin/bash
. conf_path
PATH=$PATH:/root/git/shell/basic
#kill process
! pgrep beam.smp || killall beam.smp
#delete file and Statefile
	[ -f $stateFileName ] || { log "not found stateFile";exit 236; }
	job=`bash readState.sh soft` || { log "readState error";exit 235; }
	softName=`bash nameToPath.sh $job` || exit $?
	rm -fr $installPath/$softName $stateFileName