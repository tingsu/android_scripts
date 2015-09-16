#! /bin/sh

adb -s emulator-5554 push CV-Ting_Su.pdf /mnt/sdcard/
adb -s emulator-5554 push a00001.vcf /mnt/sdcard/
adb -s emulator-5554 push license.txt /mnt/sdcard/
adb -s emulator-5554 push music.mp3 /mnt/sdcard/
adb -s emulator-5554 push pic.jpg /mnt/sdcard/

adb -s emulator-5556 push CV-Ting_Su.pdf /mnt/sdcard/
adb -s emulator-5556 push a00001.vcf /mnt/sdcard/
adb -s emulator-5556 push license.txt /mnt/sdcard/
adb -s emulator-5556 push music.mp3 /mnt/sdcard/
