#!/bin/sh

cd mod-volume-2x2_modgui.lv2
echo "Research mod-volume-2x2.lv2"

FOLDER=`sudo find / -iname mod-volume-2x2.lv2 | grep -v data | grep -v sw`

if [ -z $FOLDER ]; 

then

	echo "folder mod-volume-2x2.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_mod-volume-2x2_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<http://moddevices.com/plugins/mod-devel/mod-volume-2x2> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..
