#############################################################
#
# libcedar
#
#############################################################
LIBCEDAR_VERSION = d12173fe550cd7b3e8052d6161731b7b9bdc4fa5
LIBCEDAR_SITE = git://github.com/huceke/libcedar.git
LIBCEDAR_INSTALL_STAGING = YES
LIBCEDAR_INSTALL_TARGET = YES
LIBCEDAR_DEPENDENCIES = allwinner-cedar

define LIBCEDAR_INSTALL_STAGING_CMDS
	install -d -m 755 $(STAGING_DIR)/usr/include/libcedar
	install -m 666 $(@D)/src/CedarDecoder.h $(STAGING_DIR)/usr/include/libcedar/
	install -m 755 $(@D)/libcedar.so $(STAGING_DIR)/usr/lib/
endef

define LIBCEDAR_INSTALL_TARGET_CMDS
	install -m 755 $(@D)/libcedar.so $(TARGET_DIR)/usr/lib/
endef

define LIBCEDAR_BUILD_CMDS
	cd $(@D); ls -l; \
		sed -e "s/include/#include/g" -i Makefile; \
		$(MAKE) CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" CFLAGS="-fPIC -pipe -mcpu=cortex-a8 -mtune=cortex-a8 -mfpu=neon -mfloat-abi=hard -O3 -fomit-frame-pointer -mabi=aapcs-linux -Wno-psabi -mno-apcs-stack-check -mstructure-size-boundary=32 -mno-sched-prolog -DCEDAR_LIBRARY -DHAVE_LIBCEDAR -DOS_LINUX"
endef

$(eval $(call GENTARGETS))
