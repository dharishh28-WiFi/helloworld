include $(TOPDIR)/rules.mk

# Package details
PKG_NAME:=helloworld
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

# Package definition
define Package/helloworld
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Hello World Program
endef

# Package description
define Package/helloworld/description
 A simple Hello World program for OpenWrt.
endef

# Build preparation
define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./helloworld.c $(PKG_BUILD_DIR)/
endef

# Build steps
define Build/Compile
	$(TARGET_CC) $(TARGET_CFLAGS) \
		-o $(PKG_BUILD_DIR)/helloworld \
		$(PKG_BUILD_DIR)/helloworld.c
endef

# Install steps
define Package/helloworld/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/helloworld $(1)/usr/bin/
endef

$(eval $(call BuildPackage,helloworld))
