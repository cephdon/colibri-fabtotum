SCIENTIFIC_BUNDLE_NAME = scientific
SCIENTIFIC_BUNDLE_ORDER = 040
SCIENTIFIC_BUNDLE_VERSION = v$(shell date +%Y%m%d)
SCIENTIFIC_BUNDLE_LICENSE = GPLv2
SCIENTIFIC_BUNDLE_LICENSE_FILES = COPYING

SCIENTIFIC_BUNDLE_PACKAGES = clapack opencv

$(eval $(bundle-package))
