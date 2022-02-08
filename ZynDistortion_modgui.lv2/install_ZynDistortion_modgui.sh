#!/bin/sh

cd ZynDistortion_modgui.lv2
echo "Research ZynDistortion.lv2"

FOLDER=`sudo find / -iname ZynDistortion.lv2 | grep -v data | grep -v sw`

if [ -z $FOLDER ]; 

then

	echo "folder ZynDistortion.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_ZynDistortion_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<http://zynaddsubfx.sourceforge.net/fx#Distortion> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..
