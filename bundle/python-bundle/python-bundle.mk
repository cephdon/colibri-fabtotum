PYTHON_BUNDLE_NAME = python
PYTHON_BUNDLE_VERSION = 0.1
PYTHON_BUNDLE_LICENSE = GPLv2
PYTHON_BUNDLE_LICENSE_FILES = COPYING

PYTHON_BUNDLE_PACKAGES = python python-serial python-rpi-gpio python-numpy python-scipy python-requests python-pyyaml python-pathtools python-watchdog python-ws4py

$(eval $(bundle-package))
