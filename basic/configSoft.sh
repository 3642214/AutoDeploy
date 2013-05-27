#!/bin/bash
PATH=$PATH:/root/git/shell/basic
. conf_path
bash initWorkspace.sh || exit $?
[ -d $unzipPath ] || mkdir -p $unzipPath
softName=`bash nameToPath.sh $1` || exit $?
bash unzipFile.sh $1 || exit $?
cd $unzipPath
rm -fr ../$softName
mv -f * ../
cd ../
rm -fr $unzipPath
if [ $1 = "CLT_Master" -o $1 = "CLT_Snode" -o $1 = "RTSP" ]
	then
		bash etcSetConfig.sh $1 || exit $?
	else
	  bash setConfig.sh $1 || exit $?
fi