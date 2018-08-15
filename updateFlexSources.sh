#!/bin/bash

# Update source files for FlexControllers build out
echo "Updating OCS Inventory file"
open "smb://pesto/Projects/OCS/Inventory"
sleep 5
echo "Copying file..."
cp /Volumes/Inventory/OCSInstrumentInventory_JK.xlsx /Users/white/Repos/Dev/TAO.SVN/daw.flex-sim.proj/
echo "Unmounting..."
umount /Volumes/Inventory
echo "Taking a breath..."
sleep 10
echo "Updating GTMBA TFlex file"
open "smb://pesto/OCRD/zimmerman"
sleep 5
echo "Copying file..."
cp /Volumes/zimmerman/TFLEX_TEST\ LOG.xlsx /Users/white/Repos/Dev/TAO.SVN/daw.flex-sim.proj/TFLEX_TEST_LOG.xlsx
echo "Unmounting..."
umount /Volumes/zimmerman
echo "Done!"