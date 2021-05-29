#!/bin/bash

MAJORVERSION=${1:0:1}
LOCALBIN="/usr/local/bin"
INSTALLDIR="/opt/godot/$MAJORVERSION"
DOWNLOADLINK="https://downloads.tuxfamily.org/godotengine/$1/Godot_v$1-stable_x11.64.zip"

if [ "$EUID" -ne 0 ]
then
    echo "Please run this script as root."
    exit
fi

if torsocks curl --head --silent --fail $DOWNLOADLINK 2> /dev/null
then
    echo "Version number is valid, proceeding..."
else
    echo "Version number is invalid, please use a valid one."
    exit
fi    

if [ -d $INSTALLDIR ] 
then
    echo "Install directory exists, proceeding..."
else
    echo "Install directory does not exist, creating..."
    mkdir $INSTALLDIR
fi    

cd $INSTALLDIR
torsocks wget $DOWNLOADLINK
unzip \*.zip
mv "$(unzip -Z1 \*.zip)" "godot"
rm ./*.zip
rm $LOCALBIN/godot
ln -s $INSTALLDIR/godot $LOCALBIN/godot
