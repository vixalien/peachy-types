#!/bin/sh

echo "Entering the GNOME master flatpak runtime..."
FLATPAK_ENABLE_SDK_EXT=node26 flatpak run --share=network --command=./generate_types.sh --filesystem=$(pwd) org.gnome.Sdk//master
