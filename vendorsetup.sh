#!/bin/bash

PWDIR=$(pwd)

# if [ -d "vendor/xiaomi/miuicamera" ]; then
#     echo "vendor/xiaomi/miuicamera: done"
# else
#     git clone -b lineage-21 --single-branch https://github.com/dopaemon/android_vendor_xiaomi_miuicamera.git vendor/xiaomi/miuicamera
# fi

if [ -d "vendor/xiaomi/maycorn-camera" ]; then
    echo "vendor/xiaomi/maycorn-camera: done"
else
    git clone -b lineage-21 https://github.com/dopaemon/android_vendor_xiaomi_maycorn-camera.git vendor/xiaomi/maycorn-camera
fi

if [ -e "vendor/xiaomi/maycorn-camera/common/proprietary/system/priv-app/MiuiCamera/MiuiCamera.apk" ]; then
    echo "vendor/xiaomi/maycorn-camera/common/proprietary/system/priv-app/MiuiCamera/MiuiCamera.apk: done"
else
    wget -O vendor/xiaomi/maycorn-camera/common/proprietary/system/priv-app/MiuiCamera/MiuiCamera.apk https://github.com/dopaemon/android_vendor_xiaomi_maycorn-camera/releases/download/lineage-21/MiuiCamera.apk
fi

if [ -d "hardware/xiaomi" ]; then
    echo "hardware/xiaomi: done"
else
    git clone -b lineage-21-als --single-branch https://github.com/cupid-development/android_hardware_xiaomi.git hardware/xiaomi
fi

if [ -d "kernel/xiaomi/sm8450" ]; then
    echo "kernel/xiaomi/sm8450: done"
else
    git clone -b lineage-21 --single-branch https://github.com/dopaemon/android_kernel_xiaomi_sm8450.git kernel/xiaomi/sm8450
    cd kernel/xiaomi/sm8450
    # git fetch https://github.com/cupid-development/android_kernel_xiaomi_sm8450.git lineage-21
    # git merge FETCH_HEAD
    rm -rf KernelSU
    git submodule add -f https://github.com/tiann/KernelSU.git KernelSU
    cd $PWDIR
fi

if [ -d "kernel/xiaomi/sm8450-devicetrees" ]; then
    echo "kernel/xiaomi/sm8450-devicetrees: done"
else
    git clone -b lineage-21 --single-branch https://github.com/cupid-development/android_kernel_xiaomi_sm8450-devicetrees.git kernel/xiaomi/sm8450-devicetrees
fi

if [ -d "kernel/xiaomi/sm8450-modules" ]; then
    echo "kernel/xiaomi/sm8450-modules: done"
else
    git clone -b lineage-21 --single-branch https://github.com/cupid-development/android_kernel_xiaomi_sm8450-modules.git kernel/xiaomi/sm8450-modules
fi

if [ -d "device/xiaomi/sm8450-common" ]; then
    echo "device/xiaomi/sm8450-common: done"
else
    git clone -b lineage-21 --single-branch https://github.com/dopaemon/android_device_xiaomi_sm8450-common.git device/xiaomi/sm8450-common
fi

if [ -d "vendor/xiaomi/sm8450-common" ]; then
    echo "vendor/xiaomi/sm8450-common: done"
else
    git clone -b lineage-21 --single-branch https://github.com/dopaemon/android_vendor_xiaomi_sm8450-common.git vendor/xiaomi/sm8450-common
fi

if [ -d "vendor/xiaomi/mayfly" ]; then
    echo "vendor/xiaomi/mayfly: done"
else
    git clone -b lineage-21 --single-branch https://github.com/dopaemon/android_vendor_xiaomi_mayfly.git vendor/xiaomi/mayfly
fi

if [ -e "vendor/xiaomi/mayfly/proprietary/vendor/lib64/libxmi_high_dynamic_range_cdsp.so" ]; then
    echo "libxmi_high_dynamic_range_cdsp.so: done"
else
    wget -O vendor/xiaomi/mayfly/proprietary/vendor/lib64/libxmi_high_dynamic_range_cdsp.so https://sourceforge.net/projects/android-unofficial/files/Android-14/mayfly/vendor/libxmi_high_dynamic_range_cdsp.so
fi

if [ -e "vendor/xiaomi/mayfly/radio/modem.img" ]; then
    echo "modem.img: done"
else
    wget -O vendor/xiaomi/mayfly/radio/modem.img https://sourceforge.net/projects/android-unofficial/files/Android-14/mayfly/vendor/modem.img
fi

if [ -e "vendor/xiaomi/mayfly/radio/vm-bootsys.img" ]; then
    echo "vm-bootsys.img: done"
else
    wget -O vendor/xiaomi/mayfly/radio/vm-bootsys.img https://sourceforge.net/projects/android-unofficial/files/Android-14/mayfly/vendor/vm-bootsys.img
fi

