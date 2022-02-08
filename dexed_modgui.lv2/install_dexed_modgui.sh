#!/bin/sh
cd dexed_modgui.lv2
echo "Research Dexed.lv2"
FOLDER=`sudo find / -iwholename *dexed.lv2 | grep -v data | grep -v src | grep -v sw | grep -v modep`
VERSION=`sudo grep dcoredump $FOLDER/manifest.ttl`

if [ -z $FOLDER ]; 
then
	echo "folder dexed.lv2 not found"
	exit
	
else

	if [ -z $VERSION ];
	then
		echo "version asb2m10 detected"
		echo "imcompatibility sorry"
		#echo "copy files to $FOLDER"
		#sudo cp -r dcoredump/* $FOLDER
		#echo "add entry to manifest"
		#sudo printf "\n\n\n<https://github.com/asb2m10/dexed> rdfs:seeAlso <modgui.ttl> ." >> manifest.ttl
	else
		echo "version dcoredump detected"
		echo "copy files to $FOLDER"
		sudo cp -r dcoredump/* $FOLDER
		echo "add entry to manifest"
		sudo printf "\n\n<https://github.com/dcoredump/dexed.lv2> rdfs:seeAlso <modgui.ttl> ." >> $FOLDER/manifest.ttl
	fi

fi

cd ..