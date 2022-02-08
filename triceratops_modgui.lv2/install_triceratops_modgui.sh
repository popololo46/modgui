#!/bin/sh

cd triceratops_modgui.lv2
echo "Research triceratops.lv2"

FOLDER=`sudo find / -iname triceratops.lv2 | grep -v data | grep -v sw`

if [ -z $FOLDER ]; 

then

	echo "folder triceratops.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_triceratops_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<http://nickbailey.co.nr/triceratops> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..
