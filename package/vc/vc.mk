################################################################################
#
# vc
#
#################################################################################

VC_VERSION = 18a163f9341755b00841312af2878afeb64c131c
VC_SITE_METHOD = git
VC_SITE = git://github.com/raspberrypi/firmware.git
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
	cp $(@D)/boot/start.elf $(BINARIES_DIR)/start.elf
	cp $(@D)/boot/start_cd.elf $(BINARIES_DIR)/start_cd.elf
	cp $(@D)/boot/bootcode.bin $(BINARIES_DIR)/
	cp $(@D)/boot/fixup_cd.dat $(BINARIES_DIR)/
	cp $(@D)/boot/fixup.dat $(BINARIES_DIR)/
	cp package/vc/cmdline.txt.example $(BINARIES_DIR)/
	install -d -m 755 $(TARGET_DIR)/etc/init.d
	install -m 755 package/vc/S99vcfield $(TARGET_DIR)/etc/init.d/
	cd $(TARGET_DIR)/lib; rm -f ld-linux-armhf.so.3; ln -s ld-2.13.so ld-linux-armhf.so.3
endef

define VC_ADD_VC_LIB_PATH
  echo "/opt/vc/lib" >> $(TARGET_DIR)/etc/ld.so.conf
endef

VC_POST_INSTALL_TARGET_HOOKS += VC_ADD_VC_LIB_PATH

$(eval $(call GENTARGETS))
