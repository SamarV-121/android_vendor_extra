# Kernel
ifeq ($(PREBUILT_KERNEL), true)
include device/*/$(LINEAGE_BUILD)-kernel/BoardConfigKernel.mk
endif

# Recovery
BOARD_USES_FULL_RECOVERY_IMAGE := true
