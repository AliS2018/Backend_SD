#!/bin/bash

pass=$(cat /root/password.d/passwd.txt 2>/dev/null)
echo "$pass"
if [ -n "$pass" ]
then
    echo "root:$pass" | chpasswd
    rm /root/password.d/passwd.txt
fi

#service ssh start
/usr/sbin/sshd -D
