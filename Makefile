raspberrypi2-builddir:
	make -C buildroot BR2_EXTERNAL="$(CURDIR)/br2_external" O="$(CURDIR)/br2_external/output/raspberrypi2" raspberrypi2_defconfig

raspberrypi2: raspberrypi2-builddir
	make -C br2_external/output/raspberrypi2

raspberrypi2-source: raspberrypi2-builddir
	make -C br2_external/output/raspberrypi2 source


raspberrypi3-builddir:
	make -C buildroot BR2_EXTERNAL="$(CURDIR)/br2_external" O="$(CURDIR)/br2_external/output/raspberrypi3" raspberrypi3_defconfig

raspberrypi3: raspberrypi3-builddir
	make -C br2_external/output/raspberrypi3

raspberrypi3-source: raspberrypi3-builddir
	make -C br2_external/output/raspberrypi3 source


clean:
	rm -rf br2_external/output
