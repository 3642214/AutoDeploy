#!/bin/bash
PATH=$PATH:/root/git/shell/basic
. conf_path
function initGitPath()
{
	mkdir -p $gitPath && cd $gitPath && git clone $gitServerAddr/$1 || { log "create Git path error";exit 234;}
}
[ -n "$1" ] || { log "git_pull parameter error:no parameter";exit 255; }
name=`echo $1 | cut -d"_" -f 1`
softName=`bash nameToPath.sh $name` || exit $?
[ -d $gitPath/$name/.git ] || initGitPath $name
	cd $gitPath/$name
	git pull || { log "git_pull error";exit 254; }