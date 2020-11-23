# Google Apps
ifeq ($(WITH_GMS), true)
$(call inherit-product, vendor/gapps/gapps.mk)
endif

# Debugging
ifeq ($(WITH_DEBUGGING), true)
PRODUCT_PACKAGES += debugging.rc
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    persist.service.adb.enable=1 \
    persist.sys.usb.config=adb \
    service.adb.root=1
endif

# Face Unlock
ifneq ($(TARGET_DISABLE_ALTERNATIVE_FACE_UNLOCK), true)
PRODUCT_PACKAGES += \
    FaceUnlockService
TARGET_FACE_UNLOCK_SUPPORTED := true
endif
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face.moto_unlock_service=$(TARGET_FACE_UNLOCK_SUPPORTED)

# Flipendo
PRODUCT_PACKAGES += \
    Flipendo

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
	vendor/extra/overlay

# Permissions
PRODUCT_COPY_FILES += \
    vendor/extra/prebuilt/etc/sysconfig/pixel_experience_2020.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/pixel_experience_2020.xml

# Properties
BUILD_FINGERPRINT := google/walleye/walleye:8.1.0/OPM1.171019.011/4448085:user/release-keys
