# Google Apps
ifeq ($(WITH_GMS), true)
$(call inherit-product, vendor/gapps/common/common-vendor.mk)
endif

# Fonts
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/prebuilt/fonts/ttf,$(TARGET_COPY_OUT_PRODUCT)/fonts) \
    $(LOCAL_PATH)/prebuilt/fonts/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/init/debugging.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/debugging.rc

# Overlays
PRODUCT_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Packages
PRODUCT_PACKAGES += \
    RemovePackages \
    ThemePicker \
    messaging

# Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/permissions/privapp_whitelist_com.android.wallpaper.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp_whitelist_com.android.wallpaper.xml

# Radio
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.fflag.override.settings_provider_model=false
