################################################################################
#
# LADSPA
#
################################################################################

LADSPA_VERSION = 1.17
LADSPA_SOURCE = ladspa_sdk_$(LADSPA_VERSION).tgz
LADSPA_SITE = $(BR2_EXTERNAL_PIEJAM_PATH)/sources
LADSPA_SITE_METHOD = file
LADSPA_INSTALL_STAGING = YES
LADSPA_INSTALL_TARGET = NO
LADSPA_LICENSE = LGPL-2.1-only
LADSPA_LICENSE_FILES = doc/COPYING

define LADSPA_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0644 $(@D)/src/ladspa.h $(STAGING_DIR)/usr/include/ladspa.h
endef

$(eval $(generic-package))
