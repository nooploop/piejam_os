#!/bin/sh

# Detect backlight path (Pi 2-4 or Pi 5)
BACKLIGHT_PATH=$(ls -d /sys/class/backlight/* 2>/dev/null | head -n1)

if [ -z "$BACKLIGHT_PATH" ]; then
    echo "Error: No backlight device found in /sys/class/backlight" >&2
    exit 1
fi

start() {
    echo 0 > "$BACKLIGHT_PATH/bl_power"
}

stop() {
    echo 1 > "$BACKLIGHT_PATH/bl_power"
}

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    restart|reload)
        stop
        start
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|reload}" >&2
        exit 1
        ;;
esac
