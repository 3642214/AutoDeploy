#!/bin/bash
dfCount=`df |wc -l`
mntCount=`ls /dev |grep sd.$ |wc -l`
for((i=1;i<=$mntCount;i++))
do
  devPath=`ls /dev |grep sd.$ |sed -n "${i}p"`
  for((j=1,k=0;j<=$dfCount;j++))
    do
      mntPath=`df |sed -n "${j}p"|awk '{print $1}'| cut -d '/' -f3 |sed 's/[0-9]*//g'`
      if [ $devPath = $mntPath ]
        then
          (( k = k +1 ))
      fi
    done
  if [ $k = 0 ]
    then
       cd /root/tools/disk && ./disk2 $devPath
       if [ $? = 0 ]
         then
           /sbin/fdisk /dev/$devPath"1" << EOF
d
n
p
1


w
EOF
           if [ $? = 0 ]
           then
             mkdir -p /mnt/$devPath
             mount /dev/$devPath"1" /mnt/$devPath
             echo "/dev/$devPath"1"               /mnt/$devPath                   ext4    defaults        0 0" >> /etc/fstab
           else
             echo `date`" mkfs.ext4 "$devPath"1 error " >>$HOME/mountDisk.log
           fi
       else
         echo `date`" fdisk "$devPath" error" >>$HOME/mountDisk.log
       fi
  fi
done
