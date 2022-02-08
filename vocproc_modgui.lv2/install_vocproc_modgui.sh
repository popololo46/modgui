#!/bin/sh

cd vocproc_modgui.lv2
echo "Research vocproc.lv2"

FOLDER=`sudo find / -iname vocproc.lv2 | grep -v data | grep -v sw`

if [ -z $FOLDER ]; 

then

	echo "folder vocproc.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_vocproc_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<http://hyperglitch.com/dev/VocProc> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..
