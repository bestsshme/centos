#CENTOS SCRIPT
yum update
cd /usr/bin
#wget http://centos6.esy.es/file/badvpn-udpgw
#chmod 755 badvpn-udpgw
yum install nano
#nano /etc/rc.local
cd /usr/bin
wget http://centos6.esy.es/file/menu && chmod +x menu
wget http://centos6.esy.es/file/badvpn-udpgw && chmod +x badvpn-udpgw
wget http://centos6.esy.es/file/banned-user && chmod +x banned-user
wget http://centos6.esy.es/file/basename && chmod +x basename
wget http://centos6.esy.es/file/benchmark && chmod +x benchmark
wget http://centos6.esy.es/file/bmon && chmod +x bmon
wget http://centos6.esy.es/file/delete-user-expire && chmod +x delete-user-expire
wget http://centos6.esy.es/file/disable-user-expire && chmod +x disable-user-expire
wget http://centos6.esy.es/file/dropmon && chmod +x dropmon
wget http://centos6.esy.es/file/re-drop && chmod +x re-drop
wget http://centos6.esy.es/file/test-speed && chmod +x test-speed
wget http://centos6.esy.es/file/user-add && chmod +x user-add
wget http://centos6.esy.es/file/user-add-pptp && chmod +x user-add-pptp
wget http://centos6.esy.es/file/user-del && chmod +x user-del
wget http://centos6.esy.es/file/user-expire-list && chmod +x user-expire-list
wget http://centos6.esy.es/file/user-gen && chmod +x user-gen
wget http://centos6.esy.es/file/user-limit && chmod +x user-limit
wget http://centos6.esy.es/file/user-list && chmod +x user-list
wget http://centos6.esy.es/file/user-login && chmod +x user-login
wget http://centos6.esy.es/file/user-pass && chmod +x user-pass
wget http://centos6.esy.es/file/user-renew && chmod +x user-renew
wget http://centos6.esy.es/file/users && chmod +x users
wget http://centos6.esy.es/file/user-active-list && chmod +x user-active-list
wget http://pencabulmisteri.esy.es/centos/test.py && chmod +x test.py
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
yum -y install perl perl-Net-SSLeay openssl perl-IO-Tty
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
