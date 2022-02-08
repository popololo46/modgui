#!/bin/sh

cd 3BandSplitter_modgui.lv2
echo "Research 3BandSplitter.lv2"

FOLDER=`sudo find / -iname 3BandSplitter.lv2 | grep -v data`

if [ -z $FOLDER ]; 

then

	echo "folder 3BandSplitter.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_3BandSplitter_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<http://distrho.sf.net/plugins/3BandSplitter> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..