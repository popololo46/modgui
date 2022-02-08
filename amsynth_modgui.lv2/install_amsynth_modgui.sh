#!/bin/sh

cd amsynth_modgui.lv2
echo "Research amsynth.lv2"

FOLDER=`sudo find / -iname amsynth.lv2 | grep -v data`

if [ -z $FOLDER ]; 

then

	echo "folder amsynth.lv2 not found"

else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_amsynth_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<http://code.google.com/p/amsynth/amsynth> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..