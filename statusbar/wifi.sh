#! /bin/bash

echo "  $(nmcli -f IN-USE,SSID,SIGNAL dev wifi | grep "*" | awk '{print $2 " "  $3}')"
