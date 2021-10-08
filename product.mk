# Google Apps
ifeq ($(WITH_GMS), true)
$(call inherit-product, vendor/gapps/common/common-vendor.mk)
endif

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
