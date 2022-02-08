#!/bin/sh

cd TAL-Vocoder-2_modgui.lv2
echo "Research TAL-Vocoder-2.lv2"

FOLDER=`sudo find / -iname TAL-Vocoder-2.lv2 | grep -v data | grep -v sw`

if [ -z $FOLDER ]; 

then

	echo "folder TAL-Vocoder-2.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_TAL-Vocoder-2_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<http://kunz.corrupt.ch/products/tal-vocoder> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..
