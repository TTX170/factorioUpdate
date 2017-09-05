#!/bin/sh
#initialises the variables and gets the params
Cont=0
save=beta.zip
prev=$1
version=$2 
#validates correct versions were passed
echo "Im going to update from $prev to $version is that correct? y or n"
read correct
if [ $correct = 'y' ];
then
  echo "Updating..."
  continue
else
  echo "Please try again"
  exit
fi
#done 
#makes a new directory for the new version and changes to it
mkdir factorio_$version
cd factorio_$version
#gets the new version unzips and tidy's up
wget https://www.factorio.com/get-download/$version/headless/linux64
tar -xf linux64
rm linux64
mv factorio/* ./
rmdir factorio
#copies the relevant files across from the old version
cp ../factorio_$prev/server-settings.json ./
mkdir saves
cp ../factorio_$prev/saves/$save ./saves 
echo "Done!"
