#!/bin/sh

cd mod-volume_modgui.lv2
echo "Research mod-volume.lv2"

FOLDER=`sudo find / -iname mod-volume.lv2 | grep -v data | grep -v sw`

if [ -z $FOLDER ]; 

then

	echo "folder mod-volume.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_mod-volume_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<http://moddevices.com/plugins/mod-devel/mod-volume> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..
