#!/bin/bash

# run "bluetoothctl" to find the MAC address of your device.
MAC="80:C3:BA:7B:5E:70"

if hcitool con | grep -q "$MAC"
then
    echo -e "disconnect $MAC \nquit" | bluetoothctl
else
    echo -e "connect $MAC \nquit" | bluetoothctl
fi

#the real homie: https://askubuntu.com/a/1210001
