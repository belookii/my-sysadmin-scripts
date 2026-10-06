#!/bin/bash
# Скрипт мониторинга ресурсов системы
# Каждые N секунд записывает free -h, df -h и uptime в monitor.log

INTERVAL=30
LOG_FILE="monitor.log"

while true; do
    echo "--- $(date '+%Y-%m-%d %H:%M:%S') ---" >> "$LOG_FILE"
    free -h >> "$LOG_FILE"
    df -h >> "$LOG_FILE"
    uptime >> "$LOG_FILE"
    echo "" >> "$LOG_FILE"
    sleep "$INTERVAL"
done
