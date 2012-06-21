#############################################################
#
# fribidi
#
#############################################################
FRIBIDI_VERSION = 0.19.1
FRIBIDI_SOURCE = fribidi-$(FRIBIDI_VERSION).tar.gz
FRIBIDI_SITE = http://fribidi.org/download
FRIBIDI_INSTALL_STAGING = YES
FRIBIDI_INSTALL_TARGET = YES

FRIBIDI_CONF_OPT += --disable-glib

define FRIBIDI_INSTALL_TARGET_CMDS
       mkdir -p $(TARGET_DIR)/usr/lib
       cp -dpf $(@D)/lib/.libs/libfribidi.so* $(TARGET_DIR)/usr/lib/
endef

$(eval $(call AUTOTARGETS,package/xbmc,fribidi))
