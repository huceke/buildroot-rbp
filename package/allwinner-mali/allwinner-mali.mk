#############################################################
#
# allwinner-mali
#
#############################################################
ALLWINNER_MALI_VERSION = 2caa5d9c4880cf10225790a9f806c97a8f534372
ALLWINNER_MALI_SITE = git://github.com/linux-sunxi/mali-libs.git
ALLWINNER_MALI_INSTALL_STAGING = YES
ALLWINNER_MALI_INSTALL_TARGET = YES

define ALLWINNER_MALI_INSTALL_STAGING_CMDS
	$(MAKE) -C $(@D) VERSION=r3p0 ABI=armhf prefix=$(STAGING_DIR)/usr/ framebuffer
	$(MAKE) -C $(@D) prefix=$(STAGING_DIR)/usr/ headers
	install -m 666 package/allwinner-mali/eglplatform.h $(STAGING_DIR)/usr/include/EGL/
	install -m 666 package/allwinner-mali/fbdev_window.h $(STAGING_DIR)/usr/include/EGL/
endef

define ALLWINNER_MALI_INSTALL_TARGET_CMDS
	$(MAKE) -C $(@D) VERSION=r3p0 ABI=armhf prefix=$(TARGET_DIR)/usr/ framebuffer
endef

$(eval $(call GENTARGETS))
