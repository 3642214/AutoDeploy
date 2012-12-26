#!/bin/bash
LOCALIP=`/sbin/ip -f inet addr | grep global | awk '{print $2}' | awk -F/ '{print $1}'`
logPath=/home/testuser/workspace/skyF*/log
softName=`ls -t -1 /home/testuser/workspace/|grep skyF`
tmpPath=/home/testuser/tmp/log/$softName"_"$LOCALIP
rm -fr /home/testuser/tmp
/bin/mkdir -p $tmpPath
/bin/cp -r $logPath/*.log* $tmpPath/
[ $? = "0" ] || echo "cp fail"
 	/usr/bin/scp -r $tmpPath root@192.168.8.209:/mnt/sda/log/
	[ $? = "0" ] || echo "upload fail"
  	rm -fr /home/testuser/tmp