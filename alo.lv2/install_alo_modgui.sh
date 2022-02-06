#!/bin/sh


FOLDER=`sudo find / -iname alo.lv2 | grep -v data`

if [ -z $FOLDER ]; 
then
	echo "folder alo.lv2 not found"
else
	echo "copy files to $FOLDER"
	sudo cp -r * $FOLDER
	
	echo "add entry to manifest"
	cd $FOLDER
	sudo printf "\n\n\n<http://devcurmudgeon.com/alo> rdfs:seeAlso <modgui.ttl> ." >> manifest.ttl

	exit

fi