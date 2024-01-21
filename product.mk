# GMS
ifneq ($(LINEAGE_BUILD),)
ifeq ($(WITH_GMS), true)
$(call inherit-product, vendor/gms/common/common-vendor.mk)
DEVICE := $(LINEAGE_BUILD)_gms
else
DEVICE := $(LINEAGE_BUILD)
endif
endif

# ih8sn
PRODUCT_PACKAGES += \
    ih8sn

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ih8sn.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/ih8sn.conf

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
    lineage.updater.uri=https://lineage.samarv121.dev/ota/$(DEVICE)

PRODUCT_PACKAGES += \
    UpdaterOverlay

# Private vendor
$(call inherit-product-if-exists, vendor/priv/product.mk)
