raspberrypi2:
	make -C buildroot BR2_EXTERNAL="$(CURDIR)/br2_external" O="$(CURDIR)/br2_external/output/raspberrypi2" raspberrypi2_defconfig
	make -C br2_external/output/raspberrypi2

raspberrypi3:
	make -C buildroot BR2_EXTERNAL="$(CURDIR)/br2_external" O="$(CURDIR)/br2_external/output/raspberrypi3" raspberrypi3_defconfig
	make -C br2_external/output/raspberrypi3

clean:
	rm -rf br2_external/output