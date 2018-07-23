#detail nama perusahaan
country=ID
state=JAGOANSSH.COM
locality=JAGOANSSH.COM
organization=JAGOANSSH.COM
organizationalunit=JAGOANSSH.COM
commonname=JAGOANSSH.COM
email=JAGOANSSH.COM

# go to root
cd

# install stunnel
yum install stunnel
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1


[dropbear]
accept = 443
connect = 127.0.0.1:777

END
#pemisiom
mkdir /var/run/stunnel
chown nobody:nobody /var/run/stunnel

#membuat sertifikat
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem

#konfigurasi stunnel
wget -O /etc/rc.d/init.d/stunnel ''LINK''

#restart
/etc/init.d/stunnel restart
