#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common AwakenOS stuff.
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/awaken/config/common_full_phone.mk)

# Inherit from mayfly device
$(call inherit-product, device/xiaomi/mayfly/device.mk)

# Boot Animation Resolution
TARGET_BOOT_ANIMATION_RES := 1080

# Google Recorder
TARGET_SUPPORTS_GOOGLE_RECORDER := true

# Google Assistant
TARGET_SUPPORTS_NEXT_GEN_ASSISTANT := true

# Pixel Charger
USE_PIXEL_CHARGER := true

# UnOfficial
AWAKEN_BUILD_TYPE := UNOFFICIAL

# Face unlock
TARGET_FACE_UNLOCK_SUPPORTED := true

# Gapps
WITH_GMS := true

# Other
TARGET_ENABLE_BLUR := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_HAS_UDFPS := true
TARGET_USE_PIXEL_FINGERPRINT := true

PRODUCT_BRAND := Xiaomi
PRODUCT_DEVICE := mayfly
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := 2206123SC
PRODUCT_NAME := awaken_mayfly

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="mayfly_cn-user 14 UKQ1.231003.002 V816.0.5.0.ULTCNXM release-keys"

BUILD_FINGERPRINT := Xiaomi/mayfly_cn/mayfly:14/UKQ1.231003.002/V816.0.5.0.ULTCNXM:user/release-keys

# Miui Camera for mayfly
$(call inherit-product-if-exists, vendor/xiaomi/miuicamera/config.mk)
