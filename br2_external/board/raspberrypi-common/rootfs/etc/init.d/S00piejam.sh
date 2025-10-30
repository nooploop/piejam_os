#!/bin/sh

# Detect backlight path (Pi 2-4 or Pi 5)
backlight_path=$(ls -d /sys/class/backlight/* 2>/dev/null | head -n1)

mount_piejam_fs()
{
    mount -t ext4 -o rw,defaults,noatime /dev/mmcblk0p3 /piejam
}

wait_for_psplash_fifo()
{
    sleep 0.2
}

start()
{
    # enable backlight
    if [ -n "$backlight_path" ] ; then
        echo 0 > "$backlight_path/bl_power"
    fi

    if [ -d "/sys/block/mmcblk0/mmcblk0p3/" ] ; then
        mount_piejam_fs

        if [ -f "/piejam/.config/piejam.config" ] ; then
            rotation=$(jq -r ".app_config.display_rotation" "/piejam/.config/piejam.config")
        else
            rotation=0
        fi

        psplash -n -a $rotation &

        # wait_for_psplash_fifo
    else
        psplash -n &

        wait_for_psplash_fifo

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

        mount_piejam_fs
    fi
}

stop()
{
    psplash-write "MSG Shutdown ..."

    umount /piejam

    psplash-write "QUIT"

    # disable backlight
    if [ -n "$backlight_path" ] ; then
        echo 1 > "$backlight_path/bl_power"
    fi
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
