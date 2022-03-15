##############################################################
#
# AESD_DEVICE_DRIVER
#
##############################################################

# assignment 7 git reference
AESD_DEVICE_DRIVER_VERSION = 2d8808b5e6eb23c1f99011a97d8feaa4263b4d54
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_DEVICE_DRIVER_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-emma-harper.git
AESD_DEVICE_DRIVER_SITE_METHOD = git
AESD_DEVICE_DRIVER_GIT_SUBMODULES = YES

# Added subdirectories for files
AESD_DEVICE_DRIVER_MODULE_SUBDIRS = aesd-char-driver
AESD_DEVICE_DRIVER_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

# Add scull, misc modules, and scripts
define AESD_DEVICE_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment8/* $(TARGET_DIR)/usr/bin
	
endef


$(eval $(kernel-module))
$(eval $(generic-package))