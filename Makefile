raspberrypi2:
	make -C buildroot BR2_EXTERNAL="$(CURDIR)/br2_external" O="$(CURDIR)/br2_external/output/raspberrypi2" raspberrypi2_defconfig
	make -C br2_external/output/raspberrypi2

clean:
	rm -rf br2_external/output