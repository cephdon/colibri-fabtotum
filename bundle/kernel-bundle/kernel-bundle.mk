KERNEL_BUNDLE_NAME = kernel
KERNEL_BUNDLE_ORDER = 002
KERNEL_BUNDLE_VERSION = v$(shell date +%Y%m%d)

KERNEL_BUNDLE_PACKAGES = linux linux-firmware

$(eval $(bundle-package))
