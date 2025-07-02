#!/bin/bash


if [ "$1" == "--view" ]; then
    echo "Latest system report"
    echo -e "System uptime :\n\t$(uptime)"
    echo -e "Total RAM Useage:\n$(free -h)"
fi