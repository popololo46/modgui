#!/bin/sh

cd midi-display_modgui.lv2
echo "Research midi-display.lv2"

FOLDER=`sudo find / -iname midi-display.lv2 | grep -v data | grep -v sw`

if [ -z $FOLDER ]; 

then

	echo "folder midi-display.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_midi-display_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<https://github.com/vallsv/midi-display.lv2> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..
