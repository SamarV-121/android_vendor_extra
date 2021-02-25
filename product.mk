# Google Apps
ifeq ($(WITH_GMS), true)
$(call inherit-product, vendor/gapps/gapps.mk)
endif

# CameraGo
PRODUCT_PACKAGES += \
    CameraGo

# Charger
PRODUCT_PACKAGES += \
    product_charger_res_images

# Debugging
ifeq ($(WITH_DEBUGGING), true)
PRODUCT_PACKAGES += debugging.rc
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    persist.service.adb.enable=1 \
    persist.sys.usb.config=adb \
    service.adb.root=1
endif

# SU
ifeq ($(WITH_SU), true)
PRODUCT_PACKAGES += Superuser phh-su
endif

# Disable RescueParty due to high risk of data loss
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.disable_rescue=true

# Face Unlock
ifneq ($(TARGET_DISABLE_ALTERNATIVE_FACE_UNLOCK), true)
PRODUCT_PACKAGES += \
    FaceUnlockService
TARGET_FACE_UNLOCK_SUPPORTED := true
endif
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face.moto_unlock_service=$(TARGET_FACE_UNLOCK_SUPPORTED)

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
	vendor/extra/overlay

# Properties
PRODUCT_PRODUCT_PROPERTIES += \
    ro.build.fingerprint=google/walleye/walleye:8.1.0/OPM1.171019.011/4448085:user/release-keys

# Updater
PRODUCT_PROPERTY_OVERRIDES += \
    lineage.updater.uri=https://raw.githubusercontent.com/SamarV-121/lineage_OTA/master/$(LINEAGE_BUILD).json \
    lineage.updater.allow_downgrading=true
