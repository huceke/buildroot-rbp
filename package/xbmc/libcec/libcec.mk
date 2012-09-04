#############################################################
#
# libcec
#
#############################################################
LIBCEC_VERSION = 7e316a2f39ded0dfe46661cc4007f5c20c58da96
LIBCEC_SITE = git://github.com/Pulse-Eight/libcec.git
LIBCEC_INSTALL_STAGING = YES
LIBCEC_INSTALL_TARGET = YES
LIBCEC_AUTORECONF = YES
LIBCEC_CONF_OPT = --enable-rpi \
									--with-rpi-include-path=$(STAGING_DIR)/opt/vc/include \
									--with-rpi-lib-path=$(STAGING_DIR)/opt/vc/lib
LIBCEC_DEPENDENCIES = lockdev

$(eval $(call AUTOTARGETS))
