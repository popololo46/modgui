#!/bin/sh

cd Wolpertinger_modgui.lv2
echo "Research Wolpertinger.lv2"

FOLDER=`sudo find / -iname Wolpertinger.lv2 | grep -v data | grep -v sw`

if [ -z $FOLDER ]; 

then

	echo "folder Wolpertinger.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_Wolpertinger_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<http://tumbetoene.tuxfamily.org> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..
