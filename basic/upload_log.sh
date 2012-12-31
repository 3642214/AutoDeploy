#!/bin/bash
. conf_path
softName=`ls -t -1 /home/testuser/workspace/|grep skyF`
tmpPath=$userPath"/tmp/log/"$softName"_"$localIP
rm -fr /home/testuser/tmp
/bin/mkdir -p $tmpPath
/bin/cp -r $logPath/*.log* $tmpPath/
[ $? = "0" ] || echo "cp fail"
 	/usr/bin/scp -r $tmpPath root@192.168.8.209:/mnt/sda/log/
	[ $? = "0" ] || echo "upload fail"
  	rm -fr /home/testuser/tmp