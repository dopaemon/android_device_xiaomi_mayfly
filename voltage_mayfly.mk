#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common VoltageOS stuff.
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/voltage/config/common_full_phone.mk)

# Inherit from mayfly device
$(call inherit-product, device/xiaomi/mayfly/device.mk)

TARGET_BOOT_ANIMATION_RES := 1080
VOLTAGE_BUILD_TYPE := UNOFFICIAL

PRODUCT_BRAND := Xiaomi
PRODUCT_DEVICE := mayfly
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := 2206123SC
PRODUCT_NAME := voltage_mayfly

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="mayfly_cn-user 14 UKQ1.231003.002 V816.0.5.0.ULTCNXM release-keys"

BUILD_FINGERPRINT := Xiaomi/mayfly_cn/mayfly:14/UKQ1.231003.002/V816.0.5.0.ULTCNXM:user/release-keys

# Miui Camera for mayfly
$(call inherit-product-if-exists, vendor/xiaomi/miuicamera/config.mk)
