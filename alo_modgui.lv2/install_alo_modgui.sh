#!/bin/sh

cd alo_modgui.lv2
echo "Research alo.lv2"

FOLDER=`sudo find / -iname alo.lv2 | grep -v data`

if [ -z $FOLDER ]; 

then

	echo "folder alo.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_alo_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<http://devcurmudgeon.com/alo> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..