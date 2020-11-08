################################################################################
#
# piejam
#
################################################################################

PIEJAM_VERSION = v0.3.0
PIEJAM_SITE = https://github.com/nooploop/piejam.git
PIEJAM_SITE_METHOD = git
PIEJAM_GIT_SUBMODULES = YES

ifeq ($(BR2_PACKAGE_PIEJAM_BOOT_INTO_APP),y)
define PIEJAM_ADD_INITTAB_ENTRY
	if ! grep piejam $(TARGET_DIR)/etc/inittab ; then $(SED) '/rcS/a ::wait:\/usr\/bin\/piejam' $(TARGET_DIR)/etc/inittab ; fi
endef
PIEJAM_POST_INSTALL_TARGET_HOOKS += PIEJAM_ADD_INITTAB_ENTRY
else
define PIEJAM_REMOVE_INITTAB_ENTRY
	$(SED) '/piejam/d' $(TARGET_DIR)/etc/inittab
endef
PIEJAM_POST_INSTALL_TARGET_HOOKS += PIEJAM_REMOVE_INITTAB_ENTRY
endif

ifeq ($(BR2_PACKAGE_PIEJAM_BENCHMARKS),y)
PIEJAM_CONF_OPTS = -DPIEJAM_BENCHMARKS=ON
endif

$(eval $(cmake-package))
