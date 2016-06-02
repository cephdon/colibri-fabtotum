################################################################################
#
# cura-engine
#
################################################################################

CURA_ENGINE_VERSION = 7b2b9630c7b5ec5e4534de94b46bb37004cccb88
CURA_ENGINE_SITE = $(call github,Ultimaker,CuraEngine,$(CURA_ENGINE_VERSION))
CURA_ENGINE_LICENSE = AGPLv3
CURA_ENGINE_LICENSE_FILES = LICENSE

define CURA_ENGINE_BUILD_CMDS
	CXX=$(TARGET_CXX) \
	CXXFLAGS="$(TARGET_CXXFLAGS)" \
	CFLAGS="$(TARGET_CFLAGS)" \
	LDFLAGS="$(TARGET_LDFLAGS)" \
		$(MAKE) -C $(@D)
endef

define HOST_CURA_ENGINE_BUILD_CMDS
	$(MAKE) -C $(@D)
endef

define CURA_ENGINE_INSTALL_TARGET_CMDS
	$(MAKE) -C $(@D) DESTDIR=$(CURA_ENGINE_TARGET_DIR) install
endef

$(eval $(generic-package))
