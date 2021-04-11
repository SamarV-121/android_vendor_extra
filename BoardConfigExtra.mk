# SEPolicy
ifeq ($(WITH_SU), true)
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += vendor/extra/sepolicy/su
SELINUX_IGNORE_NEVERALLOWS := true
endif
