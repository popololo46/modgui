#!/bin/sh


FOLDER=`sudo find / -iname dexed.lv2 | grep -v data`

if [ -z $FOLDER ]; 
then
	echo "folder dexed.lv2 not found"
else
	echo "copy files to $FOLDER"
	sudo cp -r * $FOLDER
	
	echo "add entry to manifest"
	cd $FOLDER
	sudo printf "\n\n\n<https://github.com/dcoredump/dexed.lv2> rdfs:seeAlso <modgui.ttl> ." >> manifest.ttl

	exit

fi