#!/bin/sh

cd ZynPhaser_modgui.lv2
echo "Research ZynAddSubFX.lv2"

FOLDER=`sudo find / -iname ZynPhaser.lv2 | grep -v data | grep -v sw`

if [ -z $FOLDER ]; 

then

	echo "folder ZynPhaser.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_ZynPhaser_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<http://zynaddsubfx.sourceforge.net/fx#Phaser> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..
