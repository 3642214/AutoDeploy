#!/bin/bash
PATH=$PATH:/root/git/shell/basic
. conf_path
function init()
  {
  rm -fr $installPath
  devCount=`df |wc -l`
	for((i=2;i<=$devCount;i++))
	do
	  devSize=`df|awk '{print $2}'|sed -n "${i}p"`
	  SIZE=$(( 200 * 1024 * 1024 ))
	  if [ $devSize -gt $SIZE ]
	    then
	      volPath=`df|awk '{print $6}'|sed -n "${i}p"`
	      break
	  fi
	done
	mkdir -p $volPath/workspace
	ln -s $volPath/workspace $installPath
}
[ -L $installPath ] || init || { log "mkdir workspace error";exit 225; }