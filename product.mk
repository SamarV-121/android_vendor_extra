## Build system
BUILD_BROKEN_DUP_RULES := true

## Charger
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/charger,$(TARGET_COPY_OUT_PRODUCT)/etc/res)

## Debugging
PRODUCT_PACKAGES += \
    vintf

## Overlays
PRODUCT_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

## Properties
# Default ADB shell prompt
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.adb.shell=/system/xbin/bash

# Disable RescueParty due to high risk of data loss
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.disable_rescue=true

## Signing
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/certs/releasekey

## Updater
PRODUCT_PROPERTY_OVERRIDES += \
    lineage.updater.uri=https://raw.githubusercontent.com/SamarV-121/lineage_OTA/master/$(LINEAGE_BUILD).json
