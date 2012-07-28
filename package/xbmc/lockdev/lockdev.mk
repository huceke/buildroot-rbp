#############################################################
#
# lockdev
#
#############################################################
LOCKDEV_VERSION = 1.0.3
LOCKDEV_SITE = http://ftp.de.debian.org/debian/pool/main/l/lockdev
LOCKDEV_SOURCE = lockdev_$(LOCKDEV_VERSION).orig.tar.gz
LOCKDEV_INSTALL_STAGING = YES
LOCKDEV_INSTALL_TARGET = YES

define LOCKDEV_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) OPTIM= -C $(@D) V=1 shared
endef

define LOCKDEV_INSTALL_STAGING_CMDS
	$(MAKE) basedir=$(STAGING_DIR) libdir=$(STAGING_DIR)/usr/lib incdir=$(STAGING_DIR)/usr/include mandir=$(STAGING_DIR)/usr/share/man -C $(@D) install
	cd $(STAGING_DIR)/usr/lib; ln -s liblockdev.$(LOCKDEV_VERSION).so liblockdev.so
	cd $(STAGING_DIR)/usr/lib; ln -s liblockdev.$(LOCKDEV_VERSION).so liblockdev.so.1
endef

define LOCKDEV_INSTALL_TARGET_CMDS
	$(MAKE) basedir=$(TARGET_DIR) libdir=$(TARGET_DIR)/usr/lib incdir=$(TARGET_DIR)/usr/include mandir=$(TARGET_DIR)/usr/share/man -C $(@D) install
	cd $(TARGET_DIR)/usr/lib; ln -s liblockdev.$(LOCKDEV_VERSION).so liblockdev.so
	cd $(TARGET_DIR)/usr/lib; ln -s liblockdev.$(LOCKDEV_VERSION).so liblockdev.so.1
endef

$(eval $(call GENTARGETS))
