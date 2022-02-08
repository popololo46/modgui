#!/bin/sh

cd ZamGEQ31_modgui.lv2
echo "Research ZamGEQ31.lv2"

FOLDER=`sudo find / -iname ZamGEQ31.lv2 | grep -v data | grep -v sw`

if [ -z $FOLDER ]; 

then

	echo "folder ZamGEQ31.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_ZamGEQ31_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<urn:zamaudio:ZamGEQ31> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..
