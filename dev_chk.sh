#!/bin/bash

# Script to use when in need of simply viewing info about added USB devices that are com devices in /dev
# Run script > add USB device > press Enter > get new USB comm device info
# or... it can really be used for any new device that shows up in /dev as a tty device... doesn't need to be USB

# Pause function
function pause(){
   read -p "$*"
}

# Get the USB devices
DEV_BEFORE=$(ls /dev/tty*)

echo "" 
# Pause and tell the user to add the USB device
pause 'Attach the device and then press the [Enter] key to continue...'
echo ""
echo ""

# Get the USB devices after the new USB device was attached
DEV_AFTER=$(ls /dev/tty*)

echo "The attached/new device is the following one (if no output, then no device was added or detected):"

# Compare the ls command outputs and find the new device, also "trim" the output
NEW_DEVICE=$(diff <( echo "$DEV_BEFORE" ) <( echo "$DEV_AFTER" ) | awk -F "> " {'print $2'})
echo "$NEW_DEVICE"

echo ""
echo ""
