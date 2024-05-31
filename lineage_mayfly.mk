#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from mayfly device
$(call inherit-product, device/xiaomi/mayfly/device.mk)

TARGET_BOOT_ANIMATION_RES := 1080
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_USES_AOSP_RECOVERY := true

# QTI Framework boost
TARGET_SUPPORTS_FRAMEWORK_BOOST := true

# RisingOS
WITH_GMS := true
# TARGET_CORE_GMS := true
TARGET_ENABLE_BLUR := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_HAS_UDFPS := true
TARGET_USE_GOOGLE_TELEPHONY := true
TARGET_DEFAULT_PIXEL_LAUNCHER := true
RISING_BUILDTYPE := UNOFFICIAL
TARGET_SUPPORTS_NEXT_GEN_ASSISTANT := true
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_USE_PIXEL_FINGERPRINT := true

PRODUCT_BUILD_PROP_OVERRIDES += \
    RISING_MAINTAINER="KernelPanix" \
    RISING_CHIPSET="Snapdragon 8 Plus Gen 1"

PRODUCT_BRAND := Xiaomi
PRODUCT_DEVICE := mayfly
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := 2206123SC
PRODUCT_NAME := lineage_mayfly

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="mayfly-user 14 UKQ1.231003.002 V816.0.5.0.ULTCNXM release-keys"

BUILD_FINGERPRINT := Xiaomi/mayfly/mayfly:14/UKQ1.231003.002/V816.0.5.0.ULTCNXM:user/release-keys
