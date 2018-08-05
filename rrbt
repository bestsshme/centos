#!/bin/bash
tanggal=$(date +"%m-%d-%Y")
waktu=$(date +"%T")
echo "Server telah berhasil direboot pada tanggal $tanggal pukul $waktu." >> /root/log-reboot.txt
/sbin/shutdown -r now
