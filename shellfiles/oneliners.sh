#!/bin/bash
get_ip() {
  curl -s ifconfig.me
}
get_uptime() {
  uptime
}
get_servics() {
  systemctl list-units --type=service --state=running
}
get_diskUsage() {
  df -h
}
trim_ssd() {
  echo "Starting Trim ....."
  sudo fstrim -v /
  echo "Trim completed."
}
