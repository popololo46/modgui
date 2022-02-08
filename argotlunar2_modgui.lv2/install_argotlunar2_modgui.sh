#!/bin/sh

cd argotlunar2_modgui.lv2
echo "Research argotlunar2.lv2"

FOLDER=`sudo find / -iname argotlunar2.lv2 | grep -v data`

if [ -z $FOLDER ]; 

then

	echo "folder argotlunar2.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_argotlunar2_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<http://argotlunar.info/> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi

fi