#############################################################
#
# libcec
#
#############################################################
LIBCEC_VERSION = f8edb2973d37f3ebfd08291f28be5435d0cf8f64
LIBCEC_SITE = git://github.com/Pulse-Eight/libcec.git
LIBCEC_INSTALL_STAGING = YES
LIBCEC_INSTALL_TARGET = YES
LIBCEC_AUTORECONF = YES
LIBCEC_CONF_OPT = --enable-rpi \
									--with-rpi-include-path=$(TARGET_DIR)/opt/vc/include \
									--with-rpi-lib-path=$(TARGET_DIR)/opt/vc/lib
LIBCEC_DEPENDENCIES = lockdev

$(eval $(call AUTOTARGETS))
