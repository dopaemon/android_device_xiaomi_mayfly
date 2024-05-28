#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Derpfest stuff.
TARGET_DISABLE_EPPE := true
TARGET_BOOT_ANIMATION_RES := 1080
$(call inherit-product, vendor/derp/config/common_full_phone.mk)

# Inherit from mayfly device
$(call inherit-product, device/xiaomi/mayfly/device.mk)

# Official-ify
DERP_BUILDTYPE := UNOFFICIAL
TARGET_SUPPORTS_FRAMEWORK_BOOST := true
TARGET_USES_AOSP_RECOVERY := true
WITH_GMS := true
# TARGET_CORE_GMS := true
TARGET_ENABLE_BLUR := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_HAS_UDFPS := true
TARGET_USE_GOOGLE_TELEPHONY := true
TARGET_DEFAULT_PIXEL_LAUNCHER := true
TARGET_SUPPORTS_NEXT_GEN_ASSISTANT := true
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_USE_PIXEL_FINGERPRINT := true

PRODUCT_BRAND := Xiaomi
PRODUCT_DEVICE := mayfly
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := 2206123SC
PRODUCT_NAME := derp_mayfly

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Miui Camera for mayfly
$(call inherit-product-if-exists, vendor/xiaomi/miuicamera/config.mk)
