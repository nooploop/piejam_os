################################################################################
#
# LADSPA_TAP
#
################################################################################

LADSPA_TAP_VERSION = v1.0.1
LADSPA_TAP_SITE = https://github.com/tomszilagyi/tap-plugins
LADSPA_TAP_SITE_METHOD = git
LADSPA_TAP_LICENSE = GPL-2.0-only

define LADSPA_TAP_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

define LADSPA_TAP_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/*.so $(TARGET_DIR)/usr/lib/ladspa/
endef

$(eval $(generic-package))
