#CENTOS SCRIPT
yum update
cd /usr/bin
#wget https://raw.githubusercontent.com/bestsshme/centos/master/badvpn-udpgw
#chmod 755 badvpn-udpgw
yum install nano
#nano /etc/rc.local
cd /usr/bin
wget https://raw.githubusercontent.com/bestsshme/centos/master/menu && chmod +x menu
wget https://raw.githubusercontent.com/bestsshme/centos/master/badvpn-udpgw && chmod +x badvpn-udpgw
wget https://raw.githubusercontent.com/bestsshme/centos/master/banned-user && chmod +x banned-user
wget https://raw.githubusercontent.com/bestsshme/centos/master/basename && chmod +x basename
wget https://raw.githubusercontent.com/bestsshme/centos/master/benchmark && chmod +x benchmark
wget https://raw.githubusercontent.com/bestsshme/centos/master/bmon && chmod +x bmon
wget https://raw.githubusercontent.com/bestsshme/centos/master/delete-user-expire && chmod +x delete-user-expire
wget https://raw.githubusercontent.com/bestsshme/centos/master/disable-user-expire && chmod +x disable-user-expire
wget https://raw.githubusercontent.com/bestsshme/centos/master/dropmon && chmod +x dropmon
wget hhttps://raw.githubusercontent.com/bestsshme/centos/master/re-drop && chmod +x re-drop
wget https://raw.githubusercontent.com/bestsshme/centos/master/test-speed && chmod +x test-speed
wget https://raw.githubusercontent.com/bestsshme/centos/master/user-add && chmod +x user-add
wget https://raw.githubusercontent.com/bestsshme/centos/master/user-add-pptp && chmod +x user-add-pptp
wget https://raw.githubusercontent.com/bestsshme/centos/master/user-del && chmod +x user-del
wget https://raw.githubusercontent.com/bestsshme/centos/master/user-expire-list && chmod +x user-expire-list
wget https://raw.githubusercontent.com/bestsshme/centos/master/user-gen && chmod +x user-gen
wget https://raw.githubusercontent.com/bestsshme/centos/master/user-limit && chmod +x user-limit
wget https://raw.githubusercontent.com/bestsshme/centos/master/user-list && chmod +x user-list
wget https://raw.githubusercontent.com/bestsshme/centos/master/user-login && chmod +x user-login
wget https://raw.githubusercontent.com/bestsshme/centos/master/user-pass && chmod +x user-pass
wget https://raw.githubusercontent.com/bestsshme/centos/master/user-renew && chmod +x user-renew
wget https://raw.githubusercontent.com/bestsshme/centos/master/users && chmod +x users
wget https://raw.githubusercontent.com/bestsshme/centos/master/user-active-list && chmod +x user-active-list
wget hhttps://raw.githubusercontent.com/bestsshme/centos/master/test.py && chmod +x test.py
cd
#install dropbear
rpm -Uvh http://ftp-stud.hs-esslingen.de/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum install dropbear
nano /etc/init.d/dropbear
service dropbear start
chkconfig dropbear on
echo "/bin/false" >> /etc/shells
service dropbear restart
#install webmin
wget http://prdownloads.sourceforge.net/webadmin/webmin-1.710-1.noarch.rpm
rpm -U webmin-1.710-1.noarch.rpm
nano /etc/webmin/miniserv.conf
service webmin restart
#limit IP
iptables -A INPUT -p tcp --syn --dport 443 -m connlimit --connlimit-above 2 -j REJECT
service iptables save
service iptables restart
chkconfig iptables on
iptables -n -L
#screfatcher
wget https://github.com/KittyKatt/screenFetch/raw/master/screenfetch-dev
mv screenfetch-dev /usr/bin/screenfetch
chmod +x /usr/bin/screenfetch
echo "clear" >> .bash_profile
echo "screenfetch" >> .bash_profile
#squid proxy
yum -y update
yum -y install squid
mv /etc/squid/squid.conf /etc/squid.conf.bak
nano /etc/squid/squid.conf
chkconfig squid on
service squid start
netstat -grep | squid
echo -e "\e[1;33;44m[ script by: jucky vengeance ]\e[0m"  | tee -a log-install.txt
echo " #-----------------------------------------------------# "
echo " #                INSTALISASI SELESAI                  # "
echo " #                VPS SIAP DI GUNAKAN                  # "
echo " #              SCRIPT BY JUCKY VENGEANCE              # "
echo " #                                                     # "
echo " #                  WA: 083898587500                   # "
echo " #             FB: fb.com/Juckyvengeance               # "
echo " #=====================================================# "
echo ""
echo "---------------- SILAHKAN REBOOT VPS ANDA --------------"  | tee -a log-install.txt

rm centos6.sh
