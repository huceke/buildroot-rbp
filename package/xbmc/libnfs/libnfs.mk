#############################################################
#
# libnfs
#
#############################################################
LIBNFS_VERSION = 6683cec9174a10a2cd510d01a86140c0f673bfb2
LIBNFS_SITE = git://github.com/sahlberg/libnfs.git
LIBNFS_INSTALL_STAGING = YES
LIBNFS_INSTALL_TARGET = YES
LIBNFS_AUTORECONF = YES

$(eval $(call AUTOTARGETS))
