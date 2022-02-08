#!/bin/sh

cd modmeter_modgui.lv2
echo "Research midi-display.lv2"

FOLDER=`sudo find / -iname modmeter.lv2 | grep -v data | grep -v sw`

if [ -z $FOLDER ]; 

then

	echo "folder modmeter.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_modmeter_modgui.sh
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..
