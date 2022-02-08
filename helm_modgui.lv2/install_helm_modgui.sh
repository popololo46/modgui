#!/bin/sh


FOLDER=`sudo find / -iname helm.lv2 | grep -v data`

if [ -z $FOLDER ]; 
then
	echo "folder helm.lv2 not found"
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
	else
		echo "manifest.dll not found ... error"
	fi

fi