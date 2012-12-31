#!/bin/bash
#clear the config file
sed -i 's/^soft=.*$/soft=/g' $stateFileName
gitVersion=
sed -i "s/^git=.*$/git=$gitVersion/g" $stateFileName 
date=
sed -i "s/^date=.*$/date=$date/g" $stateFileName 