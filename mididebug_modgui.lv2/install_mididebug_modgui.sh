#!/bin/sh

cd mididebug_modgui.lv2
echo "Research mididebug.lv2"

FOLDER=`sudo find / -iname mididebug.lv2 | grep -v data | grep -v sw`

if [ -z $FOLDER ]; 

then

	echo "folder mididebug.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_mididebug_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<http://gareus.org/oss/lv2/mididebug> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..
