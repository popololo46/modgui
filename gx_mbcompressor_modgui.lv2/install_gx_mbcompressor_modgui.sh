#!/bin/sh

cd gx_mbcompressor_modgui.lv2
echo "Research gx_mbcompressor.lv2"

FOLDER=`sudo find / -iname gx_mbcompressor.lv2 | grep -v data | grep -v sw`

if [ -z $FOLDER ]; 

then

	echo "folder gx_mbcompressor.lv2 not found"
	
else
	if [ -f $FOLDER/manifest.ttl ];
	then
		echo "copy files to $FOLDER"
		sudo cp -r * $FOLDER
		sudo rm -r $FOLDER/install_gx_mbcompressor_modgui.sh
		echo "add entry to manifest"
		sudo printf "\n\n<http://guitarix.sourceforge.net/plugins/gx_mbcompressor_#_mbcompressor_> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	else
		echo "manifest.dll not found ... error"
	fi
fi

cd ..