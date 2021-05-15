# SEPolicy
ifneq ($(filter true,$(WITH_SU) $(WITH_DEBUGGING)),)
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += vendor/extra/sepolicy/private
SELINUX_IGNORE_NEVERALLOWS := true
endif
