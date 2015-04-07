NETWORK_BUNDLE_NAME = network
NETWORK_BUNDLE_VERSION = 0.1
NETWORK_BUNDLE_LICENSE = GPLv2
NETWORK_BUNDLE_LICENSE_FILES = COPYING

NETWORK_BUNDLE_PACKAGES = libcurl libmcrypt wireless_tools wpa_supplicant ifplugd iptables

$(eval $(bundle-package))
