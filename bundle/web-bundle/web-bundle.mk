WEB_BUNDLE_NAME = web
WEB_BUNDLE_ORDER = 010
WEB_BUNDLE_VERSION = v$(shell date +%Y%m%d)
WEB_BUNDLE_LICENSE = GPLv2
WEB_BUNDLE_LICENSE_FILES = COPYING

WEB_BUNDLE_PACKAGES = lighttpd php

$(eval $(bundle-package))
