################################################################################
#
# LADSPA_CAPS
#
################################################################################

LADSPA_CAPS_VERSION = 0.9.26
LADSPA_CAPS_SOURCE = caps_$(LADSPA_CAPS_VERSION).tar.bz2
LADSPA_CAPS_SITE = http://quitte.de/dsp
LADSPA_CAPS_INSTALL_STAGING = NO
LADSPA_CAPS_INSTALL_TARGET = YES
LADSPA_CAPS_LICENSE = GPL-3.0-only

define LADSPA_CAPS_BUILD_CMDS
	$(@D)/configure.py
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

define LADSPA_CAPS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/caps.so $(TARGET_DIR)/usr/lib/ladspa/caps.so
endef

$(eval $(generic-package))
