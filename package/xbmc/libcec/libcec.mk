#############################################################
#
# libcec
#
#############################################################
LIBCEC_VERSION = a9ac151c8265f1d241799f7d6beaf4e13d4066ca
LIBCEC_SITE = git://github.com/Pulse-Eight/libcec.git
LIBCEC_INSTALL_STAGING = YES
LIBCEC_INSTALL_TARGET = YES
LIBCEC_AUTORECONF = YES
LIBCEC_CONF_OPT = --enable-rpi \
									--with-rpi-include-path=$(STAGING_DIR)/opt/vc/include \
									--with-rpi-lib-path=$(STAGING_DIR)/opt/vc/lib \
									CFLAGS="$(TARGET_CFLAGS) -Wno-psabi" CXXFLAGS="$(TARGET_CXXFLAGS) -Wno-psabi"
LIBCEC_DEPENDENCIES = lockdev

$(eval $(call AUTOTARGETS))
