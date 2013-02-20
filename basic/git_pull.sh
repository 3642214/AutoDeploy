#!/bin/bash
. conf_path
function initGitPath()
{
	mkdir -p $gitPath && cd $gitPath && git clone $gitServerAddr/$1 || { log "create Git path error";exit 234;}
}
[ -n "$1" ] || { log "git_pull parameter error:no parameter";exit 255; }
softName=`bash nameToPath.sh $1` || exit $?
[ -d $gitPath/$1/.git ] || initGitPath $1
	cd $gitPath/$1
	git pull || { log "git_pull error";exit 254; }