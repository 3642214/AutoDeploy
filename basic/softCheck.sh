#/bin/bash
PATH=$PATH:/root/git/shell/basic
. conf_path
hopeJobs=`bash analyzeJob.sh $1`
nowJobs=`bash readState.sh soft`
[ -n "$hopeJobs" ] || [ -n "$nowJobs" ] || { echo 1;exit;}
i=0
for nj in $nowJobs
	{
	[ "${hopeJobs/$nj/}" != "$hopeJobs" ] || { ((i++)) ; bash clear_soft.sh $nj ; } || exit $?
	}
echo $i
