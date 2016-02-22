################################################################################
#
# fabui
#
################################################################################

FABUI_VERSION = 3adc99833cc7efe00eb53fc1a88f0a6ddecf0071

#FABUI_SITE = $(call github,FABtotum,colibri-fabui,$(FABUI_VERSION))
FABUI_SITE=$(BR2_EXTERNAL)/../colibri-fabui
FABUI_SITE_METHOD = local

FABUI_LICENSE = GPLv2
FABUI_LICENSE_FILES = LICENSE
FABUI_DEPENDENCIES = host-sqlite

FABUI_HTDOCS_FILES = \
	assets \
	fabui \
	index.php \
	install.php \
	lib \
	LICENSE \
	README.md \
	recovery \
	upload

FABUI_DBFILE = fabtotum.db

define FABUI_INSTALL_LIGHTTPD_FILES
	$(FABUI_FAKEROOT) $(INSTALL) -D -m 0644 $(BR2_EXTERNAL)/package/fabui/fabui.lighttpd \
		$(FABUI_TARGET_DIR)/etc/lighttpd/conf-available/99-fabui.conf
endef

define FABUI_INSTALL_DB
	$(HOST_DIR)/usr/bin/sqlite3 $(FABUI_TARGET_DIR)/var/www/$(FABUI_DBFILE) < $(@D)/recovery/install/sql/fabtotum.sqlite3
endef

define FABUI_INSTALL_TARGET_CMDS
#	Copy public htdocs files
	$(FABUI_FAKEROOT) $(INSTALL) -d -o 33 -g 33 -m 0755 $(FABUI_TARGET_DIR)/var/www
	for file in $(FABUI_HTDOCS_FILES); do \
		$(FABUI_FAKEROOT) cp -a $(@D)/$$file $(FABUI_TARGET_DIR)/var/www; \
	done
#	Create runtime data directory
	$(FABUI_FAKEROOT) $(INSTALL) -d -o 33 -g 33 -m 0755 $(FABUI_TARGET_DIR)/var/lib/fabui
#	Create log directory
	$(FABUI_FAKEROOT) $(INSTALL) -d -o 33 -g 33 -m 0755 $(FABUI_TARGET_DIR)/var/log/fabui
#	The autoinstall flag file is created at compile time
	$(FABUI_FAKEROOT) touch $(FABUI_TARGET_DIR)/var/www/AUTOINSTALL
#	Public runtime directories
	$(FABUI_FAKEROOT) $(INSTALL) -d -g 33 -m 0775 $(FABUI_TARGET_DIR)/var/www/temp
	$(FABUI_FAKEROOT) $(INSTALL) -d -g 33 -m 0775 $(FABUI_TARGET_DIR)/var/www/tasks
#	Generate Database
	$(FABUI_INSTALL_DB)
#	Fix permissions
	$(FABUI_FAKEROOT) chown -R 33:33 -R $(FABUI_TARGET_DIR)/var/www
#	Install lighttpd configuration files	
	$(FABUI_INSTALL_LIGHTTPD_FILES)
#	Install sudoers permission files
	$(FABUI_INSTALL_SUDOERS)
endef

define FABUI_INSTALL_INIT_SYSV
	$(FABUI_FAKEROOT) mkdir -p $(FABUI_TARGET_DIR)/etc/init.d
		
	$(FABUI_FAKEROOT) $(INSTALL) -D -m 0775 $(BR2_EXTERNAL)/package/fabui/fabtotum.init \
		$(FABUI_TARGET_DIR)/etc/init.d/fabtotum
	$(FABUI_FAKEROOT) $(INSTALL) -D -m 0644 $(BR2_EXTERNAL)/package/fabui/fabtotum.default \
		$(FABUI_TARGET_DIR)/etc/default/fabtotum
		
	$(FABUI_FAKEROOT) $(INSTALL) -D -m 0775 $(BR2_EXTERNAL)/package/fabui/fabui.init \
		$(FABUI_TARGET_DIR)/etc/init.d/fabui
#	$(FABUI_FAKEROOT) $(INSTALL) -D -m 0644 $(BR2_EXTERNAL)/package/fabui/fabui.default \
#		$(FABUI_TARGET_DIR)/etc/default/fabui
	$(FABUI_FAKEROOT) $(INSTALL) -D -m 0775 $(BR2_EXTERNAL)/package/fabui/fabui.first \
		$(FABUI_TARGET_DIR)/etc/firstboot.d/fabui		
	
	$(FABUI_FAKEROOT) mkdir -p $(FABUI_TARGET_DIR)/etc/rc.d/rc.firstboot.d
	$(FABUI_FAKEROOT) ln -fs ../../firstboot.d/fabui \
		$(FABUI_TARGET_DIR)/etc/rc.d/rc.firstboot.d/S10fabui
	
	$(FABUI_FAKEROOT) mkdir -p $(FABUI_TARGET_DIR)/etc/rc.d/rc.startup.d	
	$(FABUI_FAKEROOT) ln -fs ../../init.d/fabtotum \
		$(FABUI_TARGET_DIR)/etc/rc.d/rc.startup.d/S30fabtotum
	$(FABUI_FAKEROOT) ln -fs ../../init.d/fabui \
		$(FABUI_TARGET_DIR)/etc/rc.d/rc.startup.d/S40fabui
	
	$(FABUI_FAKEROOT) mkdir -p $(FABUI_TARGET_DIR)/etc/rc.d/rc.shutdown.d
	$(FABUI_FAKEROOT) ln -fs ../../init.d/fabui \
		$(FABUI_TARGET_DIR)/etc/rc.d/rc.shutdown.d/S20fabui
	$(FABUI_FAKEROOT) ln -fs ../../init.d/fabtotum \
		$(FABUI_TARGET_DIR)/etc/rc.d/rc.shutdown.d/S98fabtotum
endef

define FABUI_POST_TARGET_CLEANUP
#	$(FABUI_FAKEROOT) rm -rf $(FABUI_TARGET_DIR)/var/www/recovery/install/system/etc
endef

FABUI_POST_INSTALL_TARGET_HOOKS += FABUI_POST_TARGET_CLEANUP

define FABUI_INSTALL_SUDOERS
	$(FABUI_FAKEROOT) $(INSTALL) -d -m 0750 $(FABUI_TARGET_DIR)/etc/sudoers.d
	$(FABUI_FAKEROOT) $(INSTALL) -D -m 0440 $(BR2_EXTERNAL)/package/fabui/fabui.sudoers $(FABUI_TARGET_DIR)/etc/sudoers.d/fabui
	$(FABUI_FAKEROOT) chmod 0440 $(FABUI_TARGET_DIR)/etc/sudoers.d/fabui
endef

$(eval $(generic-package))
