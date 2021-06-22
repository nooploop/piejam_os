################################################################################
#
# piejam
#
################################################################################

PIEJAM_VERSION = v0.7.0
PIEJAM_SITE = https://github.com/nooploop/piejam.git
PIEJAM_SITE_METHOD = git
PIEJAM_GIT_SUBMODULES = YES
PIEJAM_LICENSE = GPL-3.0-or-later
PIEJAM_LICENSE_FILES = LICENSE.md LICENSES/Apache-2.0.txt LICENSES/CC0-1.0.txt LICENSES/GPL-3.0-or-later.txt

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
PIEJAM_CONF_OPTS += -DPIEJAM_BENCHMARKS=ON
endif

ifeq ($(BR2_PACKAGE_PIEJAM_TEST_APPS),y)
PIEJAM_CONF_OPTS += -DPIEJAM_BUILD_AUDIO_TEST=ON
endif

ifeq ($(BR2_PACKAGE_PIEJAM_TESTS),y)
PIEJAM_CONF_OPTS += -DPIEJAM_TESTS=ON
endif

$(eval $(cmake-package))
