# SEPolicy
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += vendor/extra/sepolicy/private

ifneq ($(filter true,$(WITH_SU) $(WITH_DEBUGGING)),)
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += vendor/extra/sepolicy/eng
SELINUX_IGNORE_NEVERALLOWS := true
endif
