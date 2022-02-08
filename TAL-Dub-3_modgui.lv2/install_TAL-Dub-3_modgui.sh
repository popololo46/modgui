#!/bin/sh

cd TAL-Dub-3_modgui.lv2
echo "Research TAL-Dub-3.lv2"

FOLDER=`sudo find / -iname TAL-Dub-3.lv2 | grep -v data | grep -v sw`

if [ -z $FOLDER ]; 

then

	echo "folder TAL-Dub-3.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_TAL-Dub-3_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<urn:juce:TalDub3> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..
