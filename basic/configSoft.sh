#!/bin/bash
. conf_path
[ -d $unzipPath ] || mkdir -p $unzipPath
softName=`bash nameToPath.sh $1` || exit $?
bash unzipFile.sh $1 || exit $?
cd $unzipPath
rm -fr ../$softName
mv -f * ../
cd ../
rm -fr $unzipPath
if [ $1 = "CLT_Master" -o $1 = "CLT_Snode" ]
	then
		bash etcSetConfig.sh $1 || exit $?
	else
	  bash setConfig.sh $1 || exit $?
fi