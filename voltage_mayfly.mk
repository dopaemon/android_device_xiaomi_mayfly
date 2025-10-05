#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common voltage stuff.
$(call inherit-product, vendor/voltage/config/common_full_phone.mk)

# Inherit from mayfly device
$(call inherit-product, device/xiaomi/mayfly/device.mk)

# Voltage Flags
TARGET_FACE_UNLOCK_SUPPORTED := true
VOLTAGE_BUILD_TYPE := UNOFFICIAL
EXTRA_UDFPS_ANIMATIONS := true

# Boost Framework
VOLTAGE_CPU_SMALL_CORES := 0,1,2
VOLTAGE_CPU_BIG_CORES   := 3,4,5,6,7
VOLTAGE_ALL_CORES       := 0-7
VOLTAGE_CPU_SYS_BG      := 0-3
VOLTAGE_CPU_BG          := 0-2
VOLTAGE_CPU_FG          := 0-5
VOLTAGE_CPU_LIMIT_BG    := 0-1
VOLTAGE_CPU_LIMIT_UI    := 0-2
VOLTAGE_CPU_DISPLAY     := 0-5

PRODUCT_BRAND := Xiaomi
PRODUCT_DEVICE := mayfly
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := 2206123SC
PRODUCT_NAME := voltage_mayfly

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="mayfly-user 15 AQ3A.241006.001 OS2.0.204.0.VLTCNXM release-keys" \
    BuildFingerprint=Xiaomi/mayfly/mayfly:15/AQ3A.241006.001/OS2.0.204.0.VLTCNXM:user/release-keys \
    DeviceProduct=mayfly \
    SystemName=mayfly

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
