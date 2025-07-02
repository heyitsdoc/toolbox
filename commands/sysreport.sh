#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
log_DIR="$(cd $SCRIPT_DIR && cd "../core/logs" && pwd)"

if [ -f $log_DIR/sysreport.log ];then
    touch $log_DIR/sysreport.log
    chmod +x $log_DIR/sysreport.log
fi

sysreport() {
    echo "Latest system report"
    echo -e "System uptime :\n\t$(uptime)"
    echo -e "Total RAM Useage:\n$(free -h)"
    echo -e "Total Disk Useage:\n$(df -h)"
    echo -e "3 Most CPU-hogging processes:\n$(ps -eo pid,comm,%cpu --sort=-%cpu | head -n 4)"
}
if [ "$1" == "--view" ]; then
    echo -e "$(cat $log_DIR/sysreport.log | tail -n 25)"
else 
    sysreport $1
fi 

echo -e "$(date '+%Y-%m-%d %H:%M:%S')-############################################################\n$(sysreport $1)\n" >> "$log_DIR/sysreport.log"



