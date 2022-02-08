#!/bin/sh

cd drowaudio-reverb_modgui.lv2
echo "Research drowaudio-reverb.lv2"

FOLDER=`sudo find / -iname drowaudio-reverb.lv2 | grep -v data`

if [ -z $FOLDER ]; 

then

	echo "folder drowaudio-reverb.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_drowaudio-reverb_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<http://www.drowaudio.co.uk/audio/audio_plugins/reverb> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..