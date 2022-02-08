#!/bin/sh

cd Obxd_modgui.lv2
echo "Research Obxd.lv2"

FOLDER=`sudo find / -iname Obxd.lv2 | grep -v data | grep -v sw`

if [ -z $FOLDER ]; 

then

	echo "folder Obxd.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_Obxd_modgui.sh
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..
