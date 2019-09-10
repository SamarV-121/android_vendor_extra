PATH_OVERRIDE_SOONG := $(shell echo $(TOOLS_PATH_OVERRIDE))

# Add variables that we wish to make available to soong here.
EXPORT_TO_SOONG := \
    KERNEL_ARCH \
    KERNEL_BUILD_OUT_PREFIX \
    KERNEL_CROSS_COMPILE \
    KERNEL_MAKE_CMD \
    KERNEL_MAKE_FLAGS \
    PATH_OVERRIDE_SOONG \
    TARGET_KERNEL_CONFIG \
    TARGET_KERNEL_SOURCE

# Setup SOONG_CONFIG_* vars to export the vars listed above.

SOONG_CONFIG_NAMESPACES += extraVarsPlugin

SOONG_CONFIG_extraVarsPlugin :=

define addVar
  SOONG_CONFIG_extraVarsPlugin += $(1)
  SOONG_CONFIG_extraVarsPlugin_$(1) := $$(subst ",\",$$($1))
endef

$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))

SOONG_CONFIG_NAMESPACES += extraGlobalVars
SOONG_CONFIG_extraGlobalVars += \
    target_init_vendor_lib

# Set default values
TARGET_INIT_VENDOR_LIB ?= vendor_init

# Soong value variables
SOONG_CONFIG_extraGlobalVars_target_init_vendor_lib := $(TARGET_INIT_VENDOR_LIB)
