################################################################################
#
# imx-vpu
#
################################################################################

IMX_VPU_VERSION = $(FREESCALE_IMX_VPU_VERSION)
IMX_VPU_SITE    = $(FREESCALE_IMX_SITE)
IMX_VPU_LICENSE = Freescale License (vpu), LGPLv2.1+ (the rest)
IMX_VPU_LICENSE_FILES = EULA
IMX_VPU_SOURCE = imx-vpu-$(IMX_VPU_VERSION).bin

IMX_VPU_INSTALL_STAGING = YES

# imx-vpu needs access to imx-specific kernel headers
IMX_VPU_DEPENDENCIES += linux
IMX_VPU_INCLUDE = \
	-I$(LINUX_DIR)/drivers/mxc/security/rng/include \
	-I$(LINUX_DIR)/drivers/mxc/security/sahara2/include \
	-idirafter $(LINUX_DIR)/include

IMX_VPU_MAKE_ENV = \
	$(TARGET_MAKE_ENV) \
	$(TARGET_CONFIGURE_OPTS) \
	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
	PLATFORM=$(BR2_PACKAGE_IMX_VPU_PLATFORM) \
	INCLUDE="$(IMX_VPU_INCLUDE)"

# The archive is a shell-self-extractor of a bzipped tar. It happens
# to extract in the correct directory (imx-vpu-x.y.z)
# The --force makes sure it doesn't fail if the source dir already exists.
# The --auto-accept skips the license check - not needed for us
# because we have legal-info
# Since there's a EULA in the bin file, extract it to imx-vpu-x.y.z/EULA
#
define IMX_VPU_EXTRACT_CMDS
	awk 'BEGIN      { start=0; } \
	     /^EOEULA/  { start = 0; } \
	                { if (start) print; } \
	     /<<EOEULA/ { start=1; }'\
	    $(DL_DIR)/$(IMX_VPU_SOURCE) > $(@D)/EULA
	cd $(BUILD_DIR); \
	sh $(DL_DIR)/$(IMX_VPU_SOURCE) --force --auto-accept
endef

define IMX_VPU_BUILD_CMDS
	$(IMX_VPU_MAKE_ENV) $(MAKE1) -C $(@D)
endef

define IMX_VPU_INSTALL_STAGING_CMDS
	$(IMX_VPU_MAKE_ENV) $(MAKE1) -C $(@D) DEST_DIR=$(STAGING_DIR) install
endef

define IMX_VPU_INSTALL_TARGET_CMDS
	$(IMX_VPU_MAKE_ENV) $(MAKE1) -C $(@D) DEST_DIR=$(TARGET_DIR) install
endef

$(eval $(call GENTARGETS))
