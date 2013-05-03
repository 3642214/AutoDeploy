#!/bin/bash
PATH=$PATH:/root/git/shell/basic
. conf_path
devCount=`df -P | wc -l`
VALUE=0
devSize=
volPath=
usedPercent=
SIZE=$((200 * 1024 * 1024))
for((i=2;i<=$devCount;i++))
do
	devSize=`df -P | awk '{print $2}'|sed -n "${i}p"`
	usedPercent=`df -Ph|awk '{print $5}'|sed -n "${i}p"|sed 's/%//g'`
	#$devSize != NULL ; $usedPercent !=NULL ; usedSiz > $SIZE ; used% > $VALUE
	if [ -n $devSize -a -n $usedPercent -a $devSize -gt $SIZE -a $usedPercent -gt $VALUE ]
		then
		volPath=`df -P |awk '{print $6}'|sed -n "${i}p"`
		#if $1 = 'all' ; delete rbw/rwr path ; else delete final
		[ -z $1 ] || [ ! $1 = "all" ] || rm -fr $volPath/rbw $volPath/rwr $volPath/tmp $volPath/lost+found
		rm -fr $volPath/final/*
		echo `date`" clean "$1" "$volPath >>/home/testuser/cleanDisk.log
	fi
done