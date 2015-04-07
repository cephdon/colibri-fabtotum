EXTRA_LIBS_BUNDLE_NAME = extra-libs
EXTRA_LIBS_BUNDLE_VERSION = 0.1
EXTRA_LIBS_BUNDLE_LICENSE = GPLv2
EXTRA_LIBS_BUNDLE_LICENSE_FILES = COPYING

EXTRA_LIBS_BUNDLE_PACKAGES = openssl pcre libxml2 gettext icu libusb libusb-compat libffi libdaemon sqlite

$(eval $(bundle-package))
