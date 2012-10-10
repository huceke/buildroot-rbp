#############################################################
#
# libcec
#
#############################################################
LIBCEC_VERSION = a6dadc0a57508ad6473b35c5d989d5e14f5ce89a
LIBCEC_SITE = git://github.com/Pulse-Eight/libcec.git
LIBCEC_INSTALL_STAGING = YES
LIBCEC_INSTALL_TARGET = YES
LIBCEC_AUTORECONF = YES
LIBCEC_CONF_OPT = --enable-rpi \
									--with-rpi-include-path=$(STAGING_DIR)/opt/vc/include \
									--with-rpi-lib-path=$(STAGING_DIR)/opt/vc/lib
LIBCEC_DEPENDENCIES = lockdev

$(eval $(call AUTOTARGETS))
