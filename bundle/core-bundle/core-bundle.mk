CORE_BUNDLE_NAME = core
CORE_BUNDLE_ORDER = 001
CORE_BUNDLE_VERSION = v$(shell date +%Y%m%d)
CORE_BUNDLE_LICENSE = GPLv2
CORE_BUNDLE_LICENSE_FILES = COPYING

CORE_BUNDLE_PACKAGES = busybox kmod ncurses readline zlib sudo nano dropbear
CORE_BUNDLE_ADD_ROOTFS = YES

$(eval $(bundle-package))
