#!/bin/sh


FOLDER=`sudo find / -iname 3BandSplitter.lv2 | grep -v data`

if [ -z $FOLDER ]; 
then
	echo "folder 3BandSplitter.lv2 not found"
else
	echo "copy files to $FOLDER"
	sudo cp -r * $FOLDER
	
	echo "add entry to manifest"
	cd $FOLDER
	sudo printf "\n\n\n<http://distrho.sf.net/plugins/3BandSplitter> rdfs:seeAlso <modgui.ttl> ." >> manifest.ttl

	exit

fi