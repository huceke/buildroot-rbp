#############################################################
#
# libnfs
#
#############################################################
LIBNFS_VERSION = c5e346e15c043a6253cc5a838dd9c77febf624aa
LIBNFS_SITE = git://github.com/sahlberg/libnfs.git
LIBNFS_INSTALL_STAGING = YES
LIBNFS_INSTALL_TARGET = YES
LIBNFS_AUTORECONF = YES

$(eval $(call AUTOTARGETS))
