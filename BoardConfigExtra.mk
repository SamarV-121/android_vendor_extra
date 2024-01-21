# Kernel
ifeq ($(PREBUILT_KERNEL), true)
include device/*/$(TARGET_DEVICE)-kernel/BoardConfigKernel.mk
endif

# Private vendor
-include vendor/priv/BoardConfigPriv.mk

# Recovery
BOARD_USES_FULL_RECOVERY_IMAGE := true
