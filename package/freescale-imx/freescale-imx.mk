################################################################################
#
# freescale-imx
#
################################################################################

FREESCALE_IMX_VERSION 					= 3.5.7-1.0.0
FREESCALE_IMX_VPU_VERSION				= 3.10.17-1.0.0_beta
FREESCALE_IMX_GPU_VERSION				= 3.10.17-1.0.0-beta
FREESCALE_LIBFSLVPUWRAP_VERSION	= 3.10.9-1.0.0
FREESCALE_IMX_SITE    					= http://www.freescale.com/lgfiles/NMG/MAD/YOCTO/

include $(sort $(wildcard package/freescale-imx/*/*.mk))
