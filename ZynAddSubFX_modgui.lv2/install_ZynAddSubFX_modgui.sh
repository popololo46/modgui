#!/bin/sh

cd ZynAddSubFX_modgui.lv2
echo "Research ZynAddSubFX.lv2"

FOLDER=`sudo find / -iname ZynAddSubFX.lv2 | grep -v data | grep -v sw`

if [ -z $FOLDER ]; 

then

	echo "folder ZynAddSubFX.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_ZynAddSubFX_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<http://zynaddsubfx.sourceforge.net> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..
