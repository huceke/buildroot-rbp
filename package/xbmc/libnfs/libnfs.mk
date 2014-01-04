#############################################################
#
# libnfs
#
#############################################################
LIBNFS_VERSION = 558aefc7364ec0ddf1250c6df5c819c166456111
LIBNFS_SITE = git://github.com/sahlberg/libnfs.git
LIBNFS_INSTALL_STAGING = YES
LIBNFS_INSTALL_TARGET = YES
LIBNFS_AUTORECONF = YES

$(eval $(call AUTOTARGETS))
