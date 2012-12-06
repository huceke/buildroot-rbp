#############################################################
#
# libcec
#
#############################################################
LIBCEC_VERSION = 6fb1aefd8e3055fd9d2f0c4e502460ada9f64f0c
LIBCEC_SITE = git://github.com/Pulse-Eight/libcec.git
LIBCEC_INSTALL_STAGING = YES
LIBCEC_INSTALL_TARGET = YES
LIBCEC_AUTORECONF = YES
LIBCEC_CONF_OPT = CFLAGS="$(TARGET_CFLAGS) -Wno-psabi" CXXFLAGS="$(TARGET_CXXFLAGS) -Wno-psabi"

LIBCEC_DEPENDENCIES = lockdev

ifeq ($(BR2_PACKAGE_LIBCEC_RBP),y)
LIBCEC_CONF_OPT += --enable-rpi \
									--with-rpi-include-path=$(STAGING_DIR)/opt/vc/include \
									--with-rpi-lib-path=$(STAGING_DIR)/opt/vc/lib
endif
$(eval $(call AUTOTARGETS))
