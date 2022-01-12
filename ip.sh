#!/bin/bash

## Activar enrrutamiento
# Con esto permitimos hacer forward de paquetes en el firewall, o sea
# que otras máquinas puedan salir a traves del firewall.
sudo echo "1" > /proc/sys/net/ipv4/ip_forward
echo "Building Routing Tables for External IP Address"
sleep 1
# Reset total del firewall

## FLUSH de reglas
sudo iptables -F
sudo iptables -X
sudo iptables -Z
sudo iptables -t nat -F

## Establecemos política por defecto
sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -t nat -P PREROUTING ACCEPT
sudo iptables -t nat -P POSTROUTING ACCEPT

## Activar Nat
sudo iptables -A FORWARD -j ACCEPT

#iptables -t nat -A PREROUTING -i enp0s8 -p tcp --dport 50080 -j DNAT --to 192.168.1.20
#iptables -t  nat -A PREROUTING -i enp0s8 -p tcp --dport 50

echo "Routing Ports between 50001-50006..."
sleep 1

iptables -t nat -A PREROUTING -i enp0s3 -p tcp -m tcp --dport 50006 -j DNAT --to 192.168.3.20:8006
echo "PORT 50006 HAS BEEN PORT-FORWARDED!"
sleep .1
clear
echo "CONNECTION TYPE: HTTPS"
clear

iptables -t nat -A PREROUTING -i enp0s3 -p tcp -m tcp --dport 50005 -j DNAT --to 192.168.3.20:22
echo "PORT 50005 HAS BEEN PORT-FORWARDED!"
sleep .1
echo "CONNECTION TYPE: SSH"
sleep 1
clear 

iptables -t nat -A PREROUTING -i enp0s3 -p tcp -m tcp --dport 50004 -j DNAT --to 192.168.3.10:8006
echo "PORT 50004 HAS BEEN PORT-FORWARDED!"
sleep .1
echo "CONNECTION TYPE: HTTPS"
sleep 1
clear

iptables -t nat -A PREROUTING -i enp0s3 -p tcp -m tcp --dport 50003 -j DNAT --to 192.168.3.10:22
echo "PORT 50003 HAS BEEN PORT-FORWARDED!"
sleep .1
echo "CONNECTION TYPE: SSH"
sleep 1
clear

iptables -t nat -A PREROUTING -i enp0s3 -p tcp -m tcp --dport 50001 -j DNAT --to 192.168.3.251:443
echo "PORT 50001 HAS BEEN PORT-FORWARDED!"
sleep .1
echo "connection type: 443 HTTPS FOR CONF"
sleep 1
clear

sleep .1
echo "This message will disappear in 10 seconds"
sleep 10

clear
echo "ADDITIONAL PORT INFORMATION..."
sleep 1
iptables -t nat -A PREROUTING -i enp0s3 -p tcp -m tcp --dport 51000 -j DNAT --to 192.168.3.4:10000
echo "ASSIGNING WEBMIN PORT AT 51000 FOR HELLOKITTY666"
sleep .1
iptables -t nat -A PREROUTING -i enp0s3 -p tcp -m tcp --dport 50022 -j DNAT --to 192.168.3.4:666
echo "ASSIGNING SSH PORT FOR AT 50022 FOR HELLOKITTY666"
sleep 1.
iptables -t nat -A PREROUTING -i enp0s3 -p tcp -m tcp --dport 3260 -j DNAT --to 192.168.3.4:3260
echo "ASSIGNING ISCSI TARGET PORT AT 3260 FROM HELLOKITTY666 -- USED NETWORK-WIDE"
sleep .1
iptables -t nat -A PREROUTING -i enp0s3 -p tcp -m tcp --dport 2049 -j DNAT --to 192.168.3.4:2049
echo "ASSIGNING NFS SERVER PORT AT 2049 FROM HELLOKITTY666 - USED NETWORK-WIDE"
sleep .1
iptables -t nat -A PREROUTING -i enp0s3 -p tcp -m tcp --dport 43389 -j DNAT --to 192.168.3.21:3389
echo "ASSIGNING RDP PORT AT 3389 FOR WINDOWS SERVER 2019 DOMAIN CONTROLLER"
sleep .1
iptables -t nat -A PREROUTING -i enp0s3 -p tcp -m tcp --dport 445 -j DNAT --to 192.168.3.21:445
echo "ASSIGNING SAMBA PORT AT 445 FOR WINDOWS SERVER 2019 DOMAIN CONTROLLER"
sleep .1
iptables -t nat -A PREROUTING -i enp0s3 -p tcp -m tcp --dport 139 -j DNAT --to 192.168.3.21:139
echo "ASSIGNING SAMBA PORT AT 139 FOR WINDOWS SERVER 2019 DOMAIN CONTROLLER"

sleep 15
clear

echo ">> CREATING ROUTES FOR CLIENT SYSTEMS..."
sleep 1
echo ">> ROUTING SSH PORT FOR UBUNTU AND ZORIN OS AT THE PORT 50042 AND 50052 RESPECTIVELY"
iptables -t nat -A PREROUTING -i enp0s3 -p tcp -m tcp --dport 50042 -j DNAT --to 192.168.3.25:22
iptables -t nat -A PREROUTING -i enp0s3 -p tcp -m tcp --dport 50052 -j DNAT --to 192.168.3.26:22
sleep 3

echo ">> ROUTING ZORIN "
iptables -t nat -A PREROUTING -i enp0s3 -p tcp -m tcp --dport 44444 -j DNAT --to 192.168.3.25:3389
sleep 1
echo ">> ROUTING UBUNTU AT PORT 55555 <<"
iptables -t nat -A PREROUTING -i enp0s3 -p tcp -m tcp --dport 55555 -j DNAT --to 192.168.3.26:3389
clear

#iptables -t nat -A PREROUTING -i enp0s3 -p tcp -m tcp --dport xxxx -j DNAT --to xxx.xxx.x.xx:xxxx
#sudo iptables -t nat -A POSTROUTING -s 172.31.0.0/16 -o eth0 -j SNAT --to 172.17.5.111 
#sudo iptables -t nat -A POSTROUTING -s 172.31.0.0/16 -o eth2 -j SNAT --to 192.168.1.100 
#sudo iptables -t nat -A POSTROUTING -s 172.31.0.0/16 -o eth3 -j SNAT --to 192.168.1.111 

## Activar Nat
# Ahora hacemos enmascaramiento de la red local
sudo iptables -t nat -A POSTROUTING -s 192.168.3.0/24 -o enp0s3 -j MASQUERADE

# Todo lo que venga por el exterior y vaya al puerto 11000 lo redirigimos 
# a una maquina interna 172.31.0.1 i puerto 11000

echo "Configuration Complete!"
sleep 1
echo "Clearing the main screen..."
echo "Make sure you know your IP address!!!"
sleep 3
clear
echo "DONE!"
sleep 1

