#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8450-common
TARGET_HAS_UDFPS := true
TARGET_BOARD_PLATFORM := taro
TARGET_KERNEL_VERSION := 6.6
ifeq ($(TARGET_PRODUCT),aospa_mayfly)
# BoardConfig supplies the prebuilt kernel and per-partition module lists.
TARGET_USES_KERNEL_PLATFORM := false
PRODUCT_COPY_FILES += device/xiaomi/mayfly-kernel/Image:kernel
endif
KERNEL_PREBUILT_DIR := device/xiaomi/mayfly-kernel
$(call inherit-product, device/xiaomi/sm8450-common/common.mk)

PRODUCT_SOONG_NAMESPACES += \
    device/qcom/common/vendor/telephony \
    hardware/qcom-caf/common/qtitelephony-compat \
    hardware/qcom-caf/sm8450-6.6 \
    hardware/qcom-caf/wlan/qcwcn \
    vendor/qcom/opensource/commonsys-intf/display

# CneApp JNI library
PRODUCT_PACKAGES += libvndfwk_detect_jni.qti.vendor:64

# Audio
PRODUCT_PACKAGES += \
    firmware_aw_cali.bin_symlink

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths_waipio_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/mixer_paths_waipio_mtp.xml \
    $(LOCAL_PATH)/audio/resourcemanager_waipio_mtp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_cape/resourcemanager_waipio_mtp.xml \
    $(LOCAL_PATH)/audio/usecaseKvManager.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usecaseKvManager.xml

# Light
$(call soong_config_set,xiaomi_sm8450_sensor_notifier,extension_lib,//device/xiaomi/mayfly:libsensor-notifier-ext-light)

# Overlay
PRODUCT_PACKAGES += \
    ApertureResMayfly \
    FrameworksResMayfly \
    LineageResMayfly \
    NfcResMayfly \
    SettingsProviderResMayfly \
    SystemUIResMayfly \
    WifiResMayfly

# PowerShare
PRODUCT_PACKAGES += \
    vendor.lineage.powershare-service.default

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Vibrator
$(call soong_config_set,qti_vibrator,effect_lib,libqtivibratoreffect.xiaomi)
$(call soong_config_set_bool,qti_vibrator,use_effect_stream,true)

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/mayfly/mayfly-vendor.mk)
