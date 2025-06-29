#!/bin/bash
kill_proc(){
# Get the header separately
header="PID   COMMAND        %CPU  %MEM
Select a process to kill"

# Build the fzf menu without the header
selected=$(ps -xU $USER -o pid,comm,%cpu,%mem --sort=-%cpu |
  awk 'NR>1' |
  fzf --header="$header" --prompt="Kill which process? ")

# Exit if user presses Esc or Ctrl+C
[[ -z "$selected" ]] && echo "❌ No process selected." && exit 1

# Get PID
pid=$(echo "$selected" | awk '{print $1}')

# Validate PID
if ! [[ "$pid" =~ ^[0-9]+$ ]]; then
  echo "⚠️ Invalid selection: not a real PID."
  exit 1
fi

# Confirm & kill
read -p "Are you sure you want to kill PID $pid? [y/N]: " confirm
[[ "$confirm" =~ ^[Yy]$ ]] && kill -9 "$pid" && echo "✅ Killed PID $pid" || echo "❎ Cancelled."
}