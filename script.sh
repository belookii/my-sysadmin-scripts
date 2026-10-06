#!/bin/bash
# Скрипт мониторинга ресурсов системы
# Каждые N секунд записывает free -h, df -h и uptime в monitor.log

INTERVAL=30
LOG_FILE="monitor.log"

trap 'echo ""; exit 0' INT TERM

if ! touch "$LOG_FILE" 2>/dev/null; then
    echo "Ошибка: нет прав на запись в $LOG_FILE" >&2
    exit 1
fi

while true; do
    {
        echo "--- $(date '+%Y-%m-%d %H:%M:%S') ---"
        free -h
        df -h
        uptime
        echo ""
    } >> "$LOG_FILE"

    if [ $? -ne 0 ]; then
        echo "Ошибка: не удалось записать в $LOG_FILE" >&2
        exit 1
    fi

    sleep "$INTERVAL"
done
