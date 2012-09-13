#############################################################
#
# libcec
#
#############################################################
LIBCEC_VERSION = 8b0462ea5e37459446a493c124e4c2d7a9e6b108
LIBCEC_SITE = git://github.com/Pulse-Eight/libcec.git
LIBCEC_INSTALL_STAGING = YES
LIBCEC_INSTALL_TARGET = YES
LIBCEC_AUTORECONF = YES
LIBCEC_CONF_OPT = --enable-rpi \
									--with-rpi-include-path=$(STAGING_DIR)/opt/vc/include \
									--with-rpi-lib-path=$(STAGING_DIR)/opt/vc/lib
LIBCEC_DEPENDENCIES = lockdev

$(eval $(call AUTOTARGETS))
