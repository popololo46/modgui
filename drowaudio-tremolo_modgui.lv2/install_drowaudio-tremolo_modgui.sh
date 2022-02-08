#!/bin/sh

cd drowaudio-tremolo_modgui.lv2
echo "Research drowaudio-tremolo.lv2"

FOLDER=`sudo find / -iname drowaudio-tremolo.lv2 | grep -v data`

if [ -z $FOLDER ]; 

then

	echo "folder drowaudio-tremolo.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_drowaudio-tremolo_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<http://www.drowaudio.co.uk/audio/audio_plugins/tremolo> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..