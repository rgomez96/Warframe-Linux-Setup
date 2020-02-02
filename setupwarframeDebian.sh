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

lookfor=$(echo $link | cut -d\/ -f8)

echo "We are looking for: " $lookfor

#Generate a download link
download=https://github.com/
download+=$(curl -s $link | grep -i $lookfor | grep -i tar.gz | grep -i releases | cut -d\" -f2)


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

echo "Setting xboxdrv now"

curl -O https://gist.githubusercontent.com/xarvh/6abfbd176a48e21886813e98480e9dc5/raw/96642aeea1a1f59d9f59cff5b6ecbb20362fdfd3/xboxdrv.service

sudo apt install xboxdrv

sudo mv xboxdrv.service /etc/systemd/system

sudo systemctl enable xboxdrv

sudo systemctl start xboxdrv


