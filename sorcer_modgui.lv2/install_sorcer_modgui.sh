#!/bin/sh

cd sorcer_modgui.lv2
echo "Research sorcer.lv2"

FOLDER=`sudo find / -iname sorcer.lv2 | grep -v data | grep -v sw`

if [ -z $FOLDER ]; 

then

	echo "folder sorcer.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_sorcer_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<http://www.openavproductions.com/sorcer> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..
