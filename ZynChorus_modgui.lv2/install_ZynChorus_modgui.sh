#!/bin/sh

cd ZynChorus_modgui.lv2
echo "Research ZynChorus.lv2"

FOLDER=`sudo find / -iname ZynChorus.lv2 | grep -v data | grep -v sw`

if [ -z $FOLDER ]; 

then

	echo "folder ZynChorus.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_ZynChorus_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<http://zynaddsubfx.sourceforge.net/fx#Chorus> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..
