#!/bin/sh

start()
{
    if [ ! -d "/sys/block/mmcblk0/mmcblk0p3/" ] ; then
        psplash-write "MSG Create data partition ..."

        p2_start=$(cat /sys/block/mmcblk0/mmcblk0p2/start)
        p2_size=$(cat /sys/block/mmcblk0/mmcblk0p2/size)
        p3_start=$(( $p2_start + $p2_size ))

        # create data partition
        parted -s /dev/mmcblk0 unit s mkpart primary ext4 $p3_start 100% print

        # wipe the superblock at the beginning
        dd if=/dev/zero of=/dev/mmcblk0p3 bs=4K count=1

        # create new filesystem
        mkfs.ext4 -L piejam /dev/mmcblk0p3

        psplash-write "MSG  "
    fi

    mount -t ext4 -o rw,defaults,noatime /dev/mmcblk0p3 /piejam
}

stop()
{
    umount /piejam
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
