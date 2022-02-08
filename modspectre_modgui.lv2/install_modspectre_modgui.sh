#!/bin/sh

cd modspectre_modgui.lv2
echo "Research modspectre.lv2"

FOLDER=`sudo find / -iname modspectre.lv2 | grep -v data | grep -v sw`

if [ -z $FOLDER ]; 

then

	echo "folder modmeter.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_modspectre_modgui.sh
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..
