#!/bin/bash
if [$# -eq 0]; then
    echo "input image:"
    exit 1
fi
echo "image path= $@"

while true; do
    read -p "continue(y/n)" yn
    case $yn in
         [Yy]* ) echo "gogogo"; break;;
         [Nn]* ) echo "exit"; exit;;
	* )	 echo "y/n only";;
    esac
done
echo "go $@"
#sudo dd bs=4M if=$@ of=/dev/sda status=progress
