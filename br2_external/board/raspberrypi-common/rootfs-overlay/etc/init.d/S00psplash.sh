#!/bin/sh

start()
{
	psplash -n&
}

stop()
{
    psplash-write "QUIT"
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
