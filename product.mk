## ADB keys
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/adb_keys:$(TARGET_ROOT_OUT)/adb_keys

## Audio
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/prebuilt/media,$(TARGET_COPY_OUT_PRODUCT)/media)

PRODUCT_PRODUCT_PROPERTIES := \
    ro.config.ringtone=Your_new_adventure.ogg \
    ro.config.notification_sound=Eureka.ogg \
    ro.config.alarm_alert=Fresh_start.ogg

PRODUCT_PACKAGES += \
    SoundPickerPrebuilt

## Camera
ifneq ($(filter %m20lte,$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += \
    Camera
endif

## Charger
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/charger,$(TARGET_COPY_OUT_PRODUCT)/etc/res)

## Debugging
$(call inherit-product-if-exists, external/tools/tools.mk)

PRODUCT_PACKAGES += \
    vintf

## Extra
PRODUCT_PACKAGES += \
    MarkupGoogle \
    WallpaperPickerGoogleRelease

# Face Unlock
TARGET_FACE_UNLOCK_SUPPORTED ?= true
ifeq ($(TARGET_FACE_UNLOCK_SUPPORTED),true)
PRODUCT_PACKAGES += \
    FaceUnlockService
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face_unlock_service.enabled=$(TARGET_FACE_UNLOCK_SUPPORTED)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml
endif

## Fonts
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/prebuilt/fonts/ttf,$(TARGET_COPY_OUT_PRODUCT)/fonts) \
    $(LOCAL_PATH)/prebuilt/fonts/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml

## Google Apps
ifeq ($(WITH_GMS), true)
$(call inherit-product, vendor/gms/products/gms.mk)

# Overlay
# PRODUCT_PACKAGES += \
   SettingsOverlayCustom
endif

## Misc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/pixel_2016_exclusive.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/pixel_2016_exclusive.xml

## Overlays
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += $(LOCAL_PATH)/overlay/no-rro
PRODUCT_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay/common $(LOCAL_PATH)/overlay/no-rro
PRODUCT_PACKAGES += \
    FrameworksOverlayWallpaper

## Properties
# Default ADB shell prompt
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.adb.shell=/system_ext/bin/bash

# Disable RescueParty due to high risk of data loss
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.disable_rescue=true

# Radio
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.fflag.override.settings_provider_model=false

# Updater
PRODUCT_PRODUCT_PROPERTIES += \
    lineage.updater.uri=https://raw.githubusercontent.com/SamarV-121/lineage_OTA/master/$(LINEAGE_BUILD).json

# Recovery
ifeq ($(filter %RM6785,$(TARGET_PRODUCT)),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.vendor.recovery_update=true
endif

## Repainter integration
PRODUCT_PACKAGES += \
    RepainterServicePriv

## Safetynet Hax
PRODUCT_PACKAGES += \
    ih8sn

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/ih8sn.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/ih8sn.conf

## Signing
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/certs/releasekey

## Themed Icons
PRODUCT_PACKAGES += \
    Launcher3OverlayThemedIcons \
    NexusLauncherOverlayThemedIcons

## Updater
PRODUCT_PRODUCT_PROPERTIES += \
    lineage.updater.uri=https://raw.githubusercontent.com/SamarV-121/lineage_OTA/master/$(LINEAGE_BUILD).json
