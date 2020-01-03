#!/bin/bash


#We will always be redirected to the latest version, using curl we will have to
#get the link we are being redirected to.

str=$(curl -s https://github.com/GloriousEggroll/proton-ge-custom/releases/latest)

link=$(echo $str | cut -d\" -f2)

echo "Latest version link: " $link

#Now we have the release link but we have to obtain the download link of the
#file. Since we know its a tar.gz link and it has to contain the version name
#we look for that.
lookfor=$(echo $link | cut -d\/ -f8)".tar.gz"

echo "We are looking for: " $lookfor

#Generate a download link
download=https://github.com/
download+=$(curl -s $link | grep -i $lookfor | grep -i releases | cut -d\" -f2)

echo "Download link: " $download

echo "Downloading now using wget"

wget -nv --show-progress $download

#Get the name of the file we are going to extract. Will only work if there are
#no more proton versions in the directory.
filename=$(ls | grep -i proton)

#Create the directory where the custom proton version will go.
echo "Creating the directory ~/.steam/root/compatibilitytools.d"

mkdir -p ~/.steam/root/compatibilitytools.d

echo "Extracting the file $filename, might take just a little while."

tar -C ~/.steam/root/compatibilitytools.d -zxf $filename

echo "File succesfully extracted. To play Warframe make sure to click on properties and make it use GE custom proton version"
