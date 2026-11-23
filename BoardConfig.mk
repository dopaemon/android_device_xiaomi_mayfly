#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/mayfly

# Security patch level
VENDOR_SECURITY_PATCH := 2026-02-01

# Inherit from sm8450-common
include device/xiaomi/sm8450-common/BoardConfigCommon.mk

ifneq ($(filter aospa_mayfly,$(TARGET_PRODUCT)),)
BOARD_SEPOLICY_M4DEFS += aospa_mayfly_qcom_ese_policy=true
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/vintf/framework_compatibility_matrix.xml

MAYFLY_KERNEL := $(DEVICE_PATH)-kernel
TARGET_PREBUILT_KERNEL := $(MAYFLY_KERNEL)/Image
TARGET_BOARD_KERNEL_HEADERS := $(MAYFLY_KERNEL)/kernel-headers
BOARD_PREBUILT_DTBIMAGE_DIR := $(MAYFLY_KERNEL)/dtbs
BOARD_PREBUILT_DTBOIMAGE := $(MAYFLY_KERNEL)/dtbs/dtbo.img

BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(wildcard $(MAYFLY_KERNEL)/vendor_ramdisk/*.ko)
BOARD_RECOVERY_KERNEL_MODULES := $(wildcard $(MAYFLY_KERNEL)/recovery/*.ko)
BOARD_VENDOR_KERNEL_MODULES := $(wildcard $(MAYFLY_KERNEL)/vendor_dlkm/*.ko)
BOARD_SYSTEM_KERNEL_MODULES := $(wildcard $(MAYFLY_KERNEL)/system_dlkm/*.ko)
BOARD_SYSTEM_KERNEL_MODULES_LOAD := $(strip $(shell cat $(MAYFLY_KERNEL)/system_dlkm/modules.load 2>/dev/null))
endif

# Audio
AUDIO_FEATURE_ENABLED_ULTRASOUND_PROXIMITY := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/properties/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/properties/vendor.prop

# Display
TARGET_SCREEN_DENSITY := 440

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 100

# Include proprietary files
include vendor/xiaomi/mayfly/BoardConfigVendor.mk
