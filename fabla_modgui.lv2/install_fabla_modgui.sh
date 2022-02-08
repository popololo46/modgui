#!/bin/sh

cd fabla_modgui.lv2
echo "Research fabla.lv2"

FOLDER=`sudo find / -iname fabla.lv2 | grep -v data`

if [ -z $FOLDER ]; 

then

	echo "folder fabla.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_fabla_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<http://www.openavproductions.com/fabla> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..