################################################################################
#
# LADSPA_TAP
#
################################################################################

LADSPA_TAP_VERSION = 85640223
LADSPA_TAP_SITE = https://git.hq.sig7.se/tap-plugins.git
LADSPA_TAP_SITE_METHOD = git
LADSPA_TAP_LICENSE = GPL-2.0-only
LADSPA_TAP_LICENSE_FILES = COPYING

define LADSPA_TAP_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

define LADSPA_TAP_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/*.so $(TARGET_DIR)/usr/lib/ladspa/
endef

$(eval $(generic-package))
