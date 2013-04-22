#############################################################
#
# libshaitplay
#
#############################################################
LIBSHAIRPLAY_VERSION = 139d5ef55564514c31f02dd82cef91236c9ff523
LIBSHAIRPLAY_SITE = git://github.com/juhovh/shairplay.git
LIBSHAIRPLAY_INSTALL_STAGING = YES
LIBSHAIRPLAY_INSTALL_TARGET = YES
LIBSHAIRPLAY_AUTORECONF = YES
#LIBSHAIRPLAY_CONF_OPT = CFLAGS="$(TARGET_CFLAGS) -Wno-psabi" CXXFLAGS="$(TARGET_CXXFLAGS) -Wno-psabi"

#LIBSHAIRPLAY_DEPENDENCIES = lockdev

#ifeq ($(BR2_PACKAGE_LIBSHAIRPLAY_RBP),y)
#LIBSHAIRPLAY_CONF_OPT += --enable-rpi \
#									--with-rpi-include-path=$(STAGING_DIR)/opt/vc/include \
#									--with-rpi-lib-path=$(STAGING_DIR)/opt/vc/lib
#endif
$(eval $(call AUTOTARGETS))
