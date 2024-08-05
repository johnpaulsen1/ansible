#!/usr/bin/bash

echo "$1"

sudo="sudo password here"
sshpass -p $sudo ssh -q -t -t -o=StrictHostKeyChecking=no -o=ConnectionAttempts=3 -o=ConnectTimeout=1 fnumber\@$1 "echo $sudo | sudo -S /usr/sbin/reboot -h now || sudo -S /usr/bin/reboot -h now"
