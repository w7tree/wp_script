#!/bin/sh

# wordpress install
echo "First: create wordpress install directory ..."
echo "please name of new directory"
read DIRECTORY
mkdir ${DIRECTORY}
cd ${DIRECTORY}


echo download wordpress.zip ...
wget http://ja.wordpress.org/latest-ja.zip

echo unzip wordpress ...
unzip latest-ja.zip

echo directory clean ...
rm latest-ja.zip
mv wordpress/* ./
rm -rf wordpress/

echo "\n"
echo install complete
