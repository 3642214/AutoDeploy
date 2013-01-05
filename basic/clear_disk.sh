#!/bin/bash
. conf_path
devCount=`df -P | wc -l`
VALUE=1
devSize=
volPath=
usedPercent=
SIZE=$((200 * 1024 * 1024))
for((i=2;i<=$devCount;i++))
do
	devSize=`df -P | awk '{print $2}'|sed -n "${i}p"`
	usedPercent=`df -Ph|awk '{print $5}'|sed -n "${i}p"|sed 's/%//g'`
	#容量大于$SIZE,已用%大于$VALUE
	if [ -n $devSize -a -n $usedPercent -a $devSize -gt $SIZE -a $usedPercent -gt $VALUE ]
		then
		volPath=`df|awk '{print $6}'|sed -n "${i}p"`
		[ ! $1 = "all" ] || rm -fr $volPath/rbw $volPath/rwr 
		rm -fr $volPath/final/*
		echo `date`" clean "$1" "$volPath >>/home/testuser/cleanDisk.log
	fi
done