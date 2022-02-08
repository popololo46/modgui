#!/bin/sh

cd vocoder_modgui.lv2
echo "Research vocoder.lv2"

FOLDER=`sudo find / -iname vocoder.lv2 | grep -v data | grep -v sw`

if [ -z $FOLDER ]; 

then

	echo "folder vocoder.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_vocoder_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<http://home.gna.org/lv2vocoder/1> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..
