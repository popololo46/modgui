#!/bin/sh

cd JuceOPL_modgui.lv2
echo "Research JuceOPL.lv2"

FOLDER=`sudo find / -iname JuceOPL.lv2 | grep -v data | grep -v sw`

if [ -z $FOLDER ]; 

then

	echo "folder JuceOPL.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_JuceOPL_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<https://bsutherland.github.io/JuceOPLVSTi/> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..
