################################################################################
#
# LADSPA
#
################################################################################

LADSPA_VERSION = 1.15
LADSPA_SOURCE = ladspa_sdk_$(LADSPA_VERSION).tgz
LADSPA_SITE = http://www.ladspa.org/download
LADSPA_INSTALL_STAGING = YES
LADSPA_INSTALL_TARGET = NO
LADSPA_LICENSE = LGPL-2.1-only
LADSPA_LICENSE_FILES = doc/COPYING

define LADSPA_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0644 $(@D)/src/ladspa.h $(STAGING_DIR)/usr/include/ladspa.h
endef

$(eval $(generic-package))
