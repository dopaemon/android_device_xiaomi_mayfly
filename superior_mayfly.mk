#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common SupperiorOS stuff.
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/superior/config/common.mk)

# Inherit from mayfly device
$(call inherit-product, device/xiaomi/mayfly/device.mk)

WITH_GMS := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_HAS_UDFPS := true
TARGET_SUPPORTS_NEXT_GEN_ASSISTANT := true
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_USE_PIXEL_FINGERPRINT := true
TARGET_USE_GOOGLE_TELEPHONY := true
TARGET_DEFAULT_PIXEL_LAUNCHER := true
TARGET_SUPPORTS_BLUR := true
TARGET_GAPPS_ARCH := arm64
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_INCLUDE_PIXEL_CHARGER := true
SUPERIOR_OFFICIAL := false
TARGET_INCLUDE_MATLOG := true
USE_MOTO_CALCULATOR := true
TARGET_SUPPORTS_FRAMEWORK_BOOST := true

PRODUCT_BRAND := Xiaomi
PRODUCT_DEVICE := mayfly
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := 2206123SC
PRODUCT_NAME := superior_mayfly

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Miui Camera for mayfly
$(call inherit-product-if-exists, vendor/xiaomi/miuicamera/config.mk)
