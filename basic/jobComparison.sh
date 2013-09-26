#/bin/bash
PATH=$PATH:/root/git/shell/basic
. conf_path
hopeJobs=`bash analyzeJob.sh $hname` || exit $?
nowJobs=`bash readState.sh soft` || exit $?
[ -n "$hopeJobs" ] || [ -n "$nowJobs" ] || { echo 1;exit;}
for hj in $hopeJobs
	{
	[ "${nowJobs/$hj/}" != "$nowJobs" ] || echo $hj
	}
