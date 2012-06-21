#############################################################
#
# tinyxml
#
#############################################################
TINYXML_VERSION = 2.6.2
TINYXML_SOURCE = tinyxml_2_6_2.tar.gz
TINYXML_SITE = http://sourceforge.net/projects/tinyxml/files/tinyxml/$(TINYXML_VERSION)/
TINYXML_INSTALL_STAGING = YES
TINYXML_INSTALL_TARGET = YES

define TINYXML_BUILD_CMDS
	cd $(@D); sed -i -e '/^TINYXML_USE_STL/ s|=.*|=YES|' -e "s|^RELEASE_CFLAGS.*|& $(CXXFLAGS) -fPIC|" Makefile
	cd $(@D); for i in tinyxml.cpp tinystr.cpp tinyxmlerror.cpp tinyxmlparser.cpp; do \
		$(TARGET_CXX) $(TARGET_CXXFLAGS) -fPIC -o $$i.o -c $$i; \
	done
	cd $(@D); $(TARGET_CXX) $(TARGET_CXXFLAGS) -shared -o libtinyxml.so.$(TINYXML_VERSION) -Wl,-soname,libtinyxml.so.0 *.cpp.o
	cd $(@D); ln -sf libtinyxml.so.$(TINYXML_VERSION) libtinyxml.so.0
	cd $(@D); ln -sf libtinyxml.so.0 libtinyxml.so
endef

define TINYXML_INSTALL_STAGING_CMDS
  install -d -m 755 $(STAGING_DIR)/usr/lib
  install -d -m 755 $(STAGING_DIR)/usr/include
	install -m 755 $(@D)/libtinyxml.so.2.6.2 $(STAGING_DIR)/usr/lib/libtinyxml.so.2.6.2
	install -m 755 $(@D)/libtinyxml.so.0 $(STAGING_DIR)/usr/lib/libtinyxml.so.0
	install -m 755 $(@D)/libtinyxml.so $(STAGING_DIR)/usr/lib/libtinyxml.so
	install -m 0644 $(@D)/tinyxml.h $(STAGING_DIR)/usr/include/
	install -m 0644 $(@D)/tinystr.h $(STAGING_DIR)/usr/include/
endef

define TINYXML_INSTALL_TARGET_CMDS
  install -d -m 755 $(TARGET_DIR)/usr/lib
  install -d -m 755 $(TARGET_DIR)/usr/include
	install -m 755 $(@D)/libtinyxml.so.2.6.2 $(TARGET_DIR)/usr/lib/libtinyxml.so.2.6.2
	install -m 755 $(@D)/libtinyxml.so.0 $(TARGET_DIR)/usr/lib/libtinyxml.so.0
	install -m 755 $(@D)/libtinyxml.so $(TARGET_DIR)/usr/lib/libtinyxml.so
endef

$(eval $(call GENTARGETS))
