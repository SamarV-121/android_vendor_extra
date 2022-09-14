# GMS
ifeq ($(WITH_GMS), true)
$(call inherit-product, vendor/gms/common/common-vendor.mk)
DEVICE := $(LINEAGE_BUILD)_gms
else
DEVICE := $(LINEAGE_BUILD)
endif

# Overlay
PRODUCT_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Recovery
ifeq ($(filter RM6785,$(LINEAGE_BUILD)),)
PRODUCT_PRODUCT_PROPERTIES += \
    persist.vendor.recovery_update=true
endif

# Signing
ifeq ($(SIGN_BUILD), true)
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/certs/releasekey
endif

# Updater
PRODUCT_PRODUCT_PROPERTIES += \
    lineage.updater.uri=https://raw.githubusercontent.com/SamarV-121/lineage_OTA/master/$(DEVICE).json
