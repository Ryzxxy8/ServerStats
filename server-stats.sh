#!/bin/sh
echo "RZXXY DEV SERVER STATS"
echo "Operating System:"
uname -s

echo ""
echo "MEMORY USAGE"
echo "------------"
if [ -r /proc/meminfo ]; then
    echo "Linux Memory Information:"
    grep -E '^(MemTotal|MemAvailable|MemFree):' /proc/meminfo
else
    echo "Memory information unavailable on this system."
fi

echo ""
echo "DISK USAGE"
echo "----------"

if command -v df >/dev/null 2>&1; then
    df -h
else
    echo "Disk information unavailable on this system."
fi

echo ""
echo "CPU USAGE"
echo "---------"

if [ -r /proc/stat ]; then
     grep '^cpu ' /proc/stat
else
    echo "CPU information unavailable on this system."
fi

echo ""
echo "TOP 5 PROCESSES BY CPU"
echo "----------------------"

if command -v ps >/dev/null 2>&1; then
    ps aux | sort -nr -k 3 | head -n 5
else
    echo "Process information unavailable on this system."
fi

echo ""
echo "TOP 5 PROCESSES BY MEMORY"
echo "-------------------------"

if command -v ps >/dev/null 2>&1; then
    ps aux | sort -nr -k 4 | head -n 5
else
    echo "Memory process information unavailable on this system."
fi

echo ""
echo "=================================="
echo "RZXXY DEV - SERVER STATS REPORT"
echo "=================================="

