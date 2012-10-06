################################################################################
#
# vc
#
#################################################################################

VC_VERSION = 1a7fbe8113ffadfde24863f6fcb50ff8be9265c6
VC_SITE_METHOD = git
VC_SITE = https://github.com/raspberrypi/firmware.git
VC_INSTALL_STAGING = YES
VC_INSTALL_TARGET = YES

define VC_INSTALL_STAGING_CMDS
	install -d -m 755 $(STAGING_DIR)/opt/vc/lib
	install -d -m 755 $(STAGING_DIR)/opt/vc/sbin
	install -d -m 755 $(STAGING_DIR)/opt/vc/bin
	install -d -m 755 $(STAGING_DIR)/opt/vc/include
	find $(@D)/hardfp/opt/vc/lib -type f -exec install -m 644 {} $(STAGING_DIR)/opt/vc/lib \;
	find $(@D)/hardfp/opt/vc/sbin -type f -exec install -m 755 {} $(STAGING_DIR)/opt/vc/sbin \;
	find $(@D)/hardfp/opt/vc/bin -type f -exec install -m 755 {} $(STAGING_DIR)/opt/vc/bin \;
	cp -rf  $(@D)/hardfp/opt/vc/include/* $(STAGING_DIR)/opt/vc/include
endef

define VC_INSTALL_TARGET_CMDS
	install -d -m 755 $(TARGET_DIR)/opt/vc/lib
	install -d -m 755 $(TARGET_DIR)/opt/vc/sbin
	install -d -m 755 $(TARGET_DIR)/opt/vc/bin
	find $(@D)/hardfp/opt/vc/lib -type f -exec install -m 644 {} $(TARGET_DIR)/opt/vc/lib \;
	find $(@D)/hardfp/opt/vc/sbin -type f -exec install -m 755 {} $(TARGET_DIR)/opt/vc/sbin \;
	find $(@D)/hardfp/opt/vc/bin -type f -exec install -m 755 {} $(TARGET_DIR)/opt/vc/bin \;
	cp $(@D)/boot/arm128_start.elf $(BINARIES_DIR)/start.elf
	cp $(@D)/boot/bootcode.bin $(BINARIES_DIR)/
	cp package/vc/cmdline.txt.example $(BINARIES_DIR)/
	install -d -m 755 $(TARGET_DIR)/etc/init.d
	install -m 755 package/vc/S99vcfield $(TARGET_DIR)/etc/init.d/
endef

define VC_ADD_VC_LIB_PATH
  echo "/opt/vc/lib" >> $(TARGET_DIR)/etc/ld.so.conf
endef

VC_POST_INSTALL_TARGET_HOOKS += VC_ADD_VC_LIB_PATH

$(eval $(call GENTARGETS))
