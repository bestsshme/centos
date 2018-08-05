#!/bin/bash
#auto reboot by jucky


#auto reboot 8 jam
wget -O /root/reboot_otomatis.sh "https://raw.githubusercontent.com/bestsshme/centos/master/rrbt"
chmod +x /root/reboot_otomatis.sh
echo "0 */08 * * * root /root/reboot_otomatis.sh" > /etc/cron.d/reboot_otomatis
service crond restart
service crond start
chkconfig crond on
