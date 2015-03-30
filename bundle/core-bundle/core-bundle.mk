CORE_BUNDLE_VERSION = 0.1
CORE_BUNDLE_LICENSE = GPLv2
CORE_BUNDLE_LICENSE_FILES = COPYING

CORE_BUNDLE_ADD_TOOLCHAIN_DEPENDENCY = NO
CORE_BUNDLE_DEPENDENCIES = ncurses readline zlib sudo nano dropbear

define EXTRACT_TO_BUNDLE
	$(CORE_BUNDLE_FAKEROOT) $(CORE_BUNDLE_FAKEROOT_ENV) tar -C $(3) -xf $($(2)_TARGET_ARCHIVE);
endef

# TODO
# - remove development files
# - remove document files
# - archive bundle using squashfs

define CORE_BUNDLE_INSTALL_TARGET_CMDS
	mkdir $(CORE_BUNDLE_TARGET_DIR)
	@$(foreach pkgname,$(CORE_BUNDLE_DEPENDENCIES),$(call EXTRACT_TO_BUNDLE,$(pkgname),$(call UPPERCASE,$(pkgname)),$(CORE_BUNDLE_TARGET_DIR)))
endef

$(eval $(virtual-package))
