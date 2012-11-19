#############################################################
#
# allwinner-cedar
#
#############################################################
ALLWINNER_CEDAR_VERSION = e524d5ec571a98a64e8a932bb6cf1ea6e63674d1
ALLWINNER_CEDAR_SITE = git://github.com/linux-sunxi/cedarx-libs.git
ALLWINNER_CEDAR_INSTALL_STAGING = YES
ALLWINNER_CEDAR_INSTALL_TARGET = YES

define ALLWINNER_CEDAR_INSTALL_STAGING_CMDS
	install -d -m 755 $(STAGING_DIR)/usr/include/libvecore
	install -m 666 $(@D)/libcedarv/linux-armhf/libvecore/libve.h $(STAGING_DIR)/usr/include/libvecore/
	install -m 666 $(@D)/libcedarv/linux-armhf/libvecore/libve_typedef.h $(STAGING_DIR)/usr/include/libvecore/
	install -m 666 $(@D)/libcedarv/linux-armhf/libvecore/libve_adapter.h $(STAGING_DIR)/usr/include/libvecore/
	install -m 666 $(@D)/libcedarv/linux-armhf/drv_display_sun4i.h $(STAGING_DIR)/usr/include/
	install -m 666 $(@D)/libcedarv/linux-armhf/cedardev_api.h $(STAGING_DIR)/usr/include/
	install -m 755 $(@D)/libcedarv/linux-armhf/libvecore/libvecore.so $(STAGING_DIR)/usr/lib/
	install -m 755 $(@D)/libcedarv/linux-armhf/adapter/avheap/libavheap.so $(STAGING_DIR)/usr/lib/
endef

define ALLWINNER_CEDAR_INSTALL_TARGET_CMDS
	install -m 755 $(@D)/libcedarv/linux-armhf/libvecore/libvecore.so $(TARGET_DIR)/usr/lib/
	install -m 755 $(@D)/libcedarv/linux-armhf/adapter/avheap/libavheap.so $(TARGET_DIR)/usr/lib/
endef

define ALLWINNER_CEDAR_BUILD_CMDS
	$(TARGET_CC) $(TARGET_CFLAGS) \
		-c $(@D)/libcedarv/linux-armhf/adapter/avheap/avheap.c -o \
		$(@D)/libcedarv/linux-armhf/adapter/avheap/avheap.o \
		-I$(@D)/libcedarv/linux-armhf/adapter/avheap/ \
		-I$(@D)/libcedarv/linux-armhf/
	$(TARGET_CC) -shared -L./ -Wl,-soname,libavheap.so \
		-o $(@D)/libcedarv/linux-armhf/adapter/avheap/libavheap.so \
		$(@D)/libcedarv/linux-armhf/adapter/avheap/avheap.o
endef

$(eval $(call GENTARGETS))
