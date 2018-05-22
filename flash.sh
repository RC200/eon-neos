#!/bin/bash
if [ ! -d files ]; then
  unzip ota-signed-latest.zip
fi

fastboot oem 4F500301
fastboot flash LOGO logo.bin
fastboot flash recovery recovery.img

# from OTA
fastboot flash boot files/boot.img
fastboot flash system files/system.img

# clear userdata
fastboot erase userdata
fastboot format cache
fastboot reboot
