#!/bin/bash

# PoomSmart's way
make clean
sudo xcode-select -s /Applications/Xcode-9.4.1.app
cd ToggleFlashVideoLoader && make ARCHS="armv7 arm64" DEBUG=0 
sudo xcode-select -s /Applications/Xcode.app
make ARCHS="armv7 arm64 arm64e" DEBUG=0 && cd ..
cd ToggleFlashVideoiOS7 && make DEBUG=0 && cd ..
cd ToggleFlashVideoiOS8 && make DEBUG=0 && cd ..
cd ToggleFlashVideoiOS9AB && make DEBUG=0 && cd ..
make DEBUG=0 package FINALPACKAGE=1 $1 $2