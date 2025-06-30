#!/bin/bash

#processes_data
if [ -n "$1" ]; then 
    if [[ "${1:2}" == "cpu" || "${1:2}" == "mem" ]]; then
       select="${1:2}"
    elif [[ "${1:2}" == "help" ]]; then
        echo -e "
        Usage: ./procdat.sh [--cpu | --mem | --help] 
        Options:
        \t--cpu     Sort and display top 5 processes by CPU usage
        \t--mem     Sort and display top 5 processes by Memory usage
        \t--help    Show this help message
        "
        exit 0
    else
        echo "error: invalid option '$1'"
        echo "Use './procdat.sh --help' for usage."
        exit 1
    fi
fi 

if [ -z "$1" ]; then
    select="cpu"
fi

procout=$(ps -eo pid,comm,%cpu,%mem --sort=-%$select | head -n 10)
echo -e "Here are the most resource-intensive processes sorted by $select usage:\n\n${procout}"

