#############################################################
#
# sg3_utils
#
#############################################################
SG3_UTILS_VERSION = 1.32
SG3_UTILS_SOURCE = sg3_utils-$(SG3_UTILS_VERSION).tar.bz2
SG3_UTILS_SITE = http://sg.danny.cz/sg/p/
SG3_UTILS_INSTALL_STAGING=YES
SG3_UTILS_INSTALL_TARGET=YES

$(eval $(call AUTOTARGETS))
