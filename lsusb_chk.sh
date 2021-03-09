#!/bin/bash

# Pause function
function pause(){
   read -p "$*"
}

# Get the USB devices
LSUSB_BEFORE=$(lsusb)

echo "" 
# Pause and tell the user to add the USB device
pause 'Attach the new USB device and then press the [Enter] key to continue...'
echo ""
echo ""

# Get the USB devices after the new USB device was attached
LSUSB_AFTER=$(lsusb)

echo "The attached/new USB device is the following one (if no output, then no device was added or detected):"

# Compare the lsusb command outputs and find the new device, also "trim" the output
NEW_DEVICE=$(diff <( echo "$LSUSB_BEFORE" ) <( echo "$LSUSB_AFTER" ) | awk -F "> " {'print $2'})
echo "$NEW_DEVICE"

echo ""
echo ""
