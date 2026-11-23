#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from mayfly device
$(call inherit-product, device/xiaomi/mayfly/device.mk)

# Inherit the AOSPA product configuration.
$(call inherit-product, vendor/aospa/target/product/aospa-target.mk)

PRODUCT_BRAND := Xiaomi
PRODUCT_DEVICE := mayfly
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := 2206123SC
PRODUCT_NAME := aospa_mayfly

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="mayfly-user 15 AQ3A.250226.002 OS3.0.3.0.VLTCNXM release-keys" \
    BuildFingerprint=Xiaomi/mayfly/mayfly:15/AQ3A.250226.002/OS3.0.3.0.VLTCNXM:user/release-keys \
    DeviceProduct=mayfly \
    SystemName=mayfly

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Use the UFS BSG UAPI exposed by the Mayfly 6.6 kernel.
$(call soong_config_set,ufsbsg,ufsframework,bsg)

# Limit Soong to the sources used by the Mayfly product.
PRODUCT_SOURCE_ROOT_DIRS += \
    -kernel/platform \
    -hardware/lineage/interfaces/health/aidl \
    -hardware/lineage/interfaces/power-libperfmgr \
    -hardware/xiaomi/packages/EsimSwitcher \
    -vendor/qcom/common/vendor/gps-legacy
