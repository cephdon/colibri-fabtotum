WEB_BUNDLE_NAME = web
WEB_BUNDLE_VERSION = 0.1
WEB_BUNDLE_LICENSE = GPLv2
WEB_BUNDLE_LICENSE_FILES = COPYING

WEB_BUNDLE_PACKAGES = lighttpd php

$(eval $(bundle-package))
