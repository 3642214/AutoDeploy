#!/bin/bash
PATH=$PATH:/root/git/shell/basic
. conf_path
softName=`ls -t -1 /home/testuser/workspace/|grep skyF`
tmpPath=$userPath"/tmp/log/"$softName"_"$localIP
rm -fr /home/testuser/tmp
/bin/mkdir -p $tmpPath
/bin/cp -r $logPath/*.log* $tmpPath/ || exit $? 
 	/usr/bin/scp -r $tmpPath root@192.168.8.213:/mnt/sda/log/ || exit $? 
  	rm -fr /home/testuser/tmp