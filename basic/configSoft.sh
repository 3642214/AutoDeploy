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
bash setConfig.sh $1 || exit $?