#!/bin/bash

#network ip bandwidth  
Interface=$(ip route get 1.1.1.1 | awk '{print $5}')
LOCAL_IP=$(hostname -i | awk '{print $1}')
PUBLIC_IP=$(curl -s ifconfig.me)
RX=$(awk '/wlan0/ { printf "%.1f", $2 / (1024*1024) }' /proc/net/dev)
TX=$(awk '/wlan0/ { printf "%.1f", $10 / (1024*1024) }' /proc/net/dev)

# echo "$@"
for arg in "$@"; do
 
    if [ "$arg" == "--local" ]; then 
        echo -e "Local IP:\t$LOCAL_IP"
        
    elif [ "$arg" == "--public" ];then 
        echo -e "Public IP:\t$PUBLIC_IP"
        
    elif [ "$arg" == "--band" ];then 
        echo -e "Bandwidth:\n\tReceived:\t$RX MB\n\ttransmitted:\t$TX MB"
        
    else 
        echo -e "Interface: $Interface"
        echo -e "IP Addresses:\n\tLocal IP:\t$LOCAL_IP\n\tPublic IP:\t$PUBLIC_IP"
        echo -e "Bandwidth:\n\tReceived:\t$RX MB\n\ttransmitted:\t$TX MB"
        
    fi

done


