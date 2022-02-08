#!/bin/sh

cd ReFine_modgui.lv2
echo "Research ReFine.lv2"

FOLDER=`sudo find / -iname ReFine.lv2 | grep -v data | grep -v sw`

if [ -z $FOLDER ]; 

then

	echo "folder ReFine.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_ReFine_modgui.sh
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..
