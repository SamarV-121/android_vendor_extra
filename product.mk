## ADB keys
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/adb_keys:$(TARGET_RECOVERY_ROOT_OUT)/root/adb_keys \
    $(LOCAL_PATH)/adb_keys:$(TARGET_ROOT_OUT)/adb_keys

## Build system
BUILD_BROKEN_DUP_RULES := true

## Charger
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/charger,$(TARGET_COPY_OUT_PRODUCT)/etc/res)

## Debugging
PRODUCT_PACKAGES += \
    vintf

## Extra
PRODUCT_PACKAGES += \
    LatinIMEGooglePrebuilt \
    MarkupGoogle

## Fonts
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/prebuilt/fonts/ttf,$(TARGET_COPY_OUT_PRODUCT)/fonts) \
    $(LOCAL_PATH)/prebuilt/fonts/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml

## Google Apps
ifeq ($(WITH_GMS), true)
$(call inherit-product, vendor/gapps/common/common-vendor.mk)
endif

## Overlays
PRODUCT_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

## PixelLauncher
PRODUCT_PACKAGES += \
    NexusLauncherRelease

## Properties
# Default ADB shell prompt
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.adb.shell=/system/xbin/bash

# Disable RescueParty due to high risk of data loss
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.disable_rescue=true

# Radio
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.fflag.override.settings_provider_model=false

# Recovery
ifeq ($(filter %RM6785,$(TARGET_PRODUCT)),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.vendor.recovery_update=true
endif

## Signing
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/certs/releasekey

## Updater
PRODUCT_PROPERTY_OVERRIDES += \
    lineage.updater.uri=https://raw.githubusercontent.com/SamarV-121/lineage_OTA/master/$(LINEAGE_BUILD).json
