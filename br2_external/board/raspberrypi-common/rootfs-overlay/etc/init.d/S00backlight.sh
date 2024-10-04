#!/bin/sh

start()
{
	echo 0 > /sys/class/backlight/rpi_backlight/bl_power
}

stop()
{
	echo 1 > /sys/class/backlight/rpi_backlight/bl_power
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
