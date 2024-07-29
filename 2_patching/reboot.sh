#!/usr/bin/bash

echo "$1"

sudo="password123!"
sshpass -p 'password123!' ssh -q -t -t -o=StrictHostKeyChecking=no -o=ConnectionAttempts=3 -o=ConnectTimeout=1 fnumber\@$1 "echo $sudo | sudo -S /usr/sbin/reboot -h now || sudo -S /usr/bin/reboot -h now"
