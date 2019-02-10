hostname1=$(whiptail --title "Sync SSH Key" --menu "Choose." 15 60 4 \
"master" "" \
"slave1" "" \
"slave2" "" \
"slave3" ""  3>&1 1>&2 2>&3)
clear
#authorized_keys
if ([ $hostname1 == "master" ]) then
    scp ~/.ssh/$(hostname)-ssh.pub root@master
fi
if ([ $hostname1 == "slave1" ]) then
    
fi