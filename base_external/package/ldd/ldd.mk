##############################################################
#
# LDD
#
##############################################################
 
# assignment 7 git reference
LDD_VERSION = a25d60c244a24138157177288610345d5db33ae5
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-emma-harper.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

# Added subdirectories for files
LDD_MODULE_SUBDIRS = scull
LDD_MODULE_SUBDIRS += misc-modules

# Add scull, misc modules, and scripts
define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin

	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))