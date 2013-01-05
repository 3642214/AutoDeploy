#!/bin/bash
. conf_path
devCount=`df |wc -l`
devSize=
volPath=
usedPercent=
SIZE=`expr 200 \* 1024 \* 1024`
for((i=2;i<=$devCount;i++))
do
	devSize=`df|awk '{print $2}'|sed -n "${i}p"`
	usedPercent=`df -h|awk '{print $5}'|sed -n "${i}p"|sed 's/%//g'`
	#容量大于$SIZE,已用%大于$VALUE
	if [ $devSize -gt $SIZE -a $usedPercent -gt $VALUE ]
		then
		volPath=`df|awk '{print $6}'|sed -n "${i}p"`
		[ ! $1 = "all" ] || rm -fr $volPath/rbw $volPath/rwr 
		rm -fr $volPath/final/*
		echo `date`" clean "$1" "$volPath >>/home/testuser/cleanDisk.log
	fi
done