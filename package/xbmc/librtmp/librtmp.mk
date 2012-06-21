#############################################################
#
#librtmp
#
#############################################################
LIBRTMP_VERSION=2.4
LIBRTMP_SOURCE=rtmpdump-$(LIBRTMP_VERSION).tar.gz
LIBRTMP_SITE=http://mirrors.xbmc.org/build-deps/darwin-libs
LIBRTMP_INSTALL_STAGING=YES

define LIBRTMP_BUILD_CMDS
	sed -ie "s|prefix=/usr/local|prefix=/usr|" $(@D)/librtmp/Makefile
        $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" AR="$(TARGET_AR)" -C $(@D)/librtmp
endef

define LIBRTMP_INSTALL_STAGING_CMDS
	$(MAKE) -C $(@D)/librtmp install DESTDIR=$(STAGING_DIR)
endef

define LIBRTMP_INSTALL_TARGET_CMDS
	install -m 644 $(@D)/librtmp/librtmp.so.0 $(TARGET_DIR)/usr/lib
endef

$(eval $(call GENTARGETS,package/xbmc,librtmp))

