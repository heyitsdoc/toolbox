#!/bin/bash


if [ "$1" == "--view" ]; then
    echo "Latest system report"
    echo -e "System uptime :\n\t$(uptime)"
    echo -e "Total RAM Useage:\n$(free -h)"
    echo -e "Total Disk Useage:\n$(df -h)"
    echo -e "3 Most CPU-hogging processes:\n$(ps -eo pid,comm,%cpu --sort=-%cpu | head -n 4)"
fi