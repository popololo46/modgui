#!/bin/sh

cd 3BandEQ_modgui.lv2
echo "Research 3BandEQ.lv2"

FOLDER=`sudo find / -iname 3BandEQ.lv2 | grep -v data`

if [ -z $FOLDER ]; 

then

	echo "folder 3BandEQ.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_3BandEQ_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<http://distrho.sf.net/plugins/3BandEQ> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..