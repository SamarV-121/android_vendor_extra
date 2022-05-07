# Overlay
PRODUCT_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Recovery
ifeq ($(filter RM6785,$(LINEAGE_BUILD)),)
PRODUCT_PRODUCT_PROPERTIES += \
    persist.vendor.recovery_update=true
endif
