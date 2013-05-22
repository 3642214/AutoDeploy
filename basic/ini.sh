#!/bin/bash
PATH=$PATH:/root/git/shell/basic
. conf_path
[[ $# > 1 ]]||{ echo "arg error"; exit; }
INIFILE=`echo $stateFileName`
SECTION=$1
ITEM=$2
NEWVAL=$3

function ReadINIfile()
  {
  ReadINI=`awk -F '=' '/\['$SECTION'\]/{a=1}a==1&&$1~/'$ITEM'/{print $2;exit}' $INIFILE`
  echo $ReadINI
}

function WriteINIfile()
  {
  WriteINI=`sed -i "/^\[$SECTION\]/,/^\[/ {/^\[$SECTION\]/b;/^\[/b;s/^$ITEM=.*/$ITEM=$NEWVAL/g;}" $INIFILE`
  echo $WriteINI
  }

if [ -z "$3" ]
then
   ReadINIfile $1 $2
else
  WriteINIfile $1 $2 $3
fi
