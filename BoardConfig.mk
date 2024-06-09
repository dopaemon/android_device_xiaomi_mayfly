#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/mayfly

ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true
DISABLE_ARTIFACT_PATH_REQUIREMENTS := true
BUILD_BROKEN_INCORRECT_PARTITION_IMAGES := true

# Inherit from sm8450-common
include device/xiaomi/sm8450-common/BoardConfigCommon.mk

# Inherit from proprietary files for miuicamera
include device/xiaomi/miuicamera-mayfly/BoardConfig.mk

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/properties/system.prop

# Display
TARGET_SCREEN_DENSITY := 440

# Kernel modules
BOOT_KERNEL_MODULES += \
    goodix_fod.ko \
    qcom_pm8008-regulator.ko \
    fts_touch_spi.ko \
    qcom-hv-haptics.ko
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD += $(BOOT_KERNEL_MODULES)
BOARD_VENDOR_KERNEL_MODULES_LOAD += $(BOOT_KERNEL_MODULES)

# Vibrator
TARGET_QTI_VIBRATOR_EFFECT_LIB := libqtivibratoreffect.xiaomi
TARGET_QTI_VIBRATOR_USE_EFFECT_STREAM := true

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 100

# Include proprietary files
include vendor/xiaomi/mayfly/BoardConfigVendor.mk
