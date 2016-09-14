################################################################################
#
# python-fabui-speedups
#
################################################################################

PYTHON_FABUI_SPEEDUPS_VERSION = 1.0.0
#PYTHON_FABUI_SPEEDUPS_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
#PYTHON_FABUI_SPEEDUPS_SITE = http://downloads.sourceforge.net/numpy
#PYTHON_FABUI_SPEEDUPS_LICENSE = BSD-3c
#PYTHON_FABUI_SPEEDUPS_LICENSE_FILES = LICENSE.txt

PYTHON_FABUI_SPEEDUPS_SITE			= $(BR2_EXTERNAL)/../colibri-fabui/speedups
PYTHON_FABUI_SPEEDUPS_SITE_METHOD 	= local

PYTHON_FABUI_SPEEDUPS_SETUP_TYPE = distutils


$(eval $(python-package))
#$(eval $(host-python-package))
