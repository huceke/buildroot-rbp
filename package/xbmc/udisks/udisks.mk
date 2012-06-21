#############################################################
#
# udisks
#
#############################################################
UDISKS_VERSION = 1.0.4
UDISKS_SOURCE = udisks-$(UDISKS_VERSION).tar.gz
UDISKS_SITE = http://hal.freedesktop.org/releases/
UDISKS_DEPENDENCIES = dbus sg3_utils

UDISKS_DEPENDENCIES = host-pkg-config

UDISKS_CONF_OPT = --disable-static \
			--enable-shared \
      --disable-man-pages \
      --disable-gtk-doc \
      --disable-gtk-doc-html \
      --disable-gtk-doc-pdf \
      --disable-lvm2 \
      --disable-dmmp \
      --disable-remote-access \
      --enable-nls

#define USBMOUNT_INSTALL_TARGET_CMDS
#	$(INSTALL) -m 0755 -D $(@D)/usbmount $(TARGET_DIR)/usr/share/usbmount/usbmount
#
#	$(INSTALL) -m 0755 -D $(@D)/00_create_model_symlink 	\
#		$(TARGET_DIR)/etc/usbmount/usbmount.d/00_create_model_symlink
#	$(INSTALL) -m 0755 -D $(@D)/00_remove_model_symlink 	\
#		$(TARGET_DIR)/etc/usbmount/usbmount.d/00_remove_model_symlink
#
#	$(INSTALL) -m 0644 -D $(@D)/usbmount.rules $(TARGET_DIR)/lib/udev/rules.d/usbmount.rules
#	@if [ ! -f $(TARGET_DIR)/etc/usbmount/usbmount.conf ]; then \
#	        $(INSTALL) -m 0644 -D $(@D)/usbmount.conf $(TARGET_DIR)/etc/usbmount/usbmount.conf; \
#	fi
#
#	mkdir -p $(addprefix $(TARGET_DIR)/media/usb,0 1 2 3 4 5 6 7)
#endef

#define USBMOUNT_UNINSTALL_TARGET_CMDS
#	rm -rf $(TARGET_DIR)/etc/usbmount			\
#		$(TARGET_DIR)/usr/share/usbmount/usbmount	\
#		$(TARGET_DIR)/lib/udev/rules.d/usbmount.rules	\
#		$(TARGET_DIR)/media/usb?
#endef

$(eval $(call AUTOTARGETS))
