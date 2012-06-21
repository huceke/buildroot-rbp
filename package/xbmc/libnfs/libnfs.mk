#############################################################
#
# libnfs
#
#############################################################
LIBNFS_VERSION = 47e5a2c74007f57751ebe9054669404eeb2fe948
LIBNFS_SITE = git://github.com/sahlberg/libnfs.git
LIBNFS_INSTALL_STAGING = YES
LIBNFS_INSTALL_TARGET = YES
LIBNFS_AUTORECONF = YES

$(eval $(call AUTOTARGETS))
