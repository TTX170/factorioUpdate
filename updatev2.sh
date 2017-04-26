#!/bin/sh
#Checks the version numbers are correct
echo "Factorio update script"
Cont=0
until [ $Cont -eq 1 ];
do
echo 'Enter the version of Factorio you are upgarding from in x.x.x format'
read prev
echo 'Enter the version of Factorio you wish to download in x.x.x format'
read version
echo "I am going to upgrade from '$prev' to '$version' Is this correct? y or n"
read correct

if [ $correct = 'y' ];
then
	Cont=1
else
	echo "Script reset plase re-enter"
fi
done 
#makes a new directory for the new version and changes to it
mkdir factorio_$version
cd factorio_$version
#gets the new version unzips and tidy's up
wget https://www.factorio.com/get-download/$version/headless/linux64
tar -xvf linux64
rm linux64
mv factorio/* ./
rmdir factorio
#copies the relevant files across from the old version
cp ../factorio_$prev/factorio/server-settings.json ./
mkdir saves
cp ../factorio_$prev/factorio/saves/beta.zip ./saves 
