#!/bin/sh

DEVICE_DIR="devices/$(hostname)"

case $1 in
    "to")
	# Delete configuration files in /etc/nixos/
	rm -r /etc/nixos/*
	# Copy device-specific directory
	cp -r $DEVICE_DIR /etc/nixos/devices/
	# Copy configuration files that are not device-specific
	for fileordir in configs configuration.nix modules;
	do
	    cp -r $fileordir /etc/nixos/
	done
	;;
    "from")
	# Delete configuration files in the current folder
	rm -r configuration.nix configs modules $DEVICE_DIR
	# Copy device-specific directory
	cp -r /etc/nixos/devices $DEVICE_DIR
	# Copy configuration files that are not device-specific
	for fileordir in configs configuration.nix modules;
	do
	    cp -r /etc/nixos/$fileordir .
	done
	;;
    *)
	echo "Invalid argument!"
	;;
esac
