#!/bin/bash

MYIP=$(wget -qO- ipv4.icanhazip.com)

	clear

	echo "--------------- Selamat datang di Server - IP: $MYIP ---------------"
	echo "--------------------#============================#------------------"
	echo ""
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

	echo -e "\e[032;1mCPU model:\e[0m $cname"
	echo -e "\e[032;1mNumber of cores:\e[0m $cores"
	echo -e "\e[032;1mCPU frequency:\e[0m $freq MHz"
	echo -e "\e[032;1mTotal amount of ram:\e[0m $tram MB"
	echo -e "\e[032;1mTotal amount of swap:\e[0m $swap MB"
	echo -e "\e[032;1mSystem uptime:\e[0m $up"
	echo "------------------------------------------------------------------------------"
	echo "Apa yang ingin Anda lakukan?"
	echo -e "\e[031;1m 1\e[0m) Buat Akun SSH/OpenVPN (\e[34;1muser-add\e[0m)"
	echo -e "\e[031;1m 2\e[0m) Perpanjang Akun (\e[34;1muser-renew\e[0m)"
	echo -e "\e[031;1m 3\e[0m) Cek Login (\e[34;1muserlogin\e[0m)"
	echo -e "\e[031;1m 4\e[0m) User Login (\e[34;1muserlog\e[0m)"
	echo -e "\e[031;1m 5\e[0m) Cek Performa VPS (\e[34;1mbench\e[0m)"
	echo -e "\e[031;1m 6\e[0m) Cek Pemakainan RAM (\e[34;1mmem\e[0m)"
	echo -e "\e[031;1m 7\e[0m) Cek User Dan Masa Aktif (\e[34;1muserlist\e[0m)"
	echo -e "\e[031;1m 8\e[0m) Hapus User (\e[34;1mhapus\e[0m)"
	echo -e "\e[031;1m 9\e[0m) Kill Multi Login Manual (1-2 Login) (\e[34;1muser-limit [x]\e[0m)"
	echo -e "\e[031;1m10\e[0m) Delete Akun Expire (\e[34;1mdelete-user-expire\e[0m)"
	echo -e "\e[031;1m11\e[0m) Banned Akun (\e[34;1mbanned-user\e[0m)"
	echo -e "\e[031;1m12\e[0m) Restart Dropbear (\e[34;1mre-drop\e[0m)"
	echo -e "\e[031;1m13\e[0m) Restart SSL/TLS (\e[34;1mstunnnel\e[0m)"
	echo -e "\e[031;1m14\e[0m) Speedtest (\e[34;1mtest-speed\e[0m)"
	echo -e "\e[031;1m15\e[0m) Reboot Server (\e[34;1mreboot\e[0m)"
	echo ""
	echo -e "\e[031;1m x\e[0m) Exit"
	echo ""
	read -p "Masukkan pilihan anda, kemudian tekan tombol ENTER: " option1
	case $option1 in
		1)
		clear
		user-add
		exit
		;;
		2)
		clear
		user-renew
		exit
		;;
		3)
		clear
		userlogin
		exit
		;;
		4)
		clear
		userlog
		exit
		;;
		5)
		clear
		bench
		exit
		;;
		6)
		clear
		mem
		exit
		;;
		7)
		clear
		userlist
		exit
		;;
		8)
		clear
		user-login
		exit
		;;
		9)
		clear
		read -p "Isikan Maximal Login (1-2): " MULTILOGIN
		user-limit $MULTILOGIN
		exit
		;;
		10)
		clear
		delete-user-expire
		exit
		;;
		11)
		clear
		banned-user
		exit
		;;
		12)
		clear
		service dropbear restart
		exit
		;;
		13)
		clear
		service stunnel restart
		exit
		;;
		14)
		clear
		peedtest --share
		exit
		;;
		15)
		clear
		reboot
		exit
		;;
		x)
		clear
		exit
		;;
	esac
done

cd ~/
rm -f /root/IP
