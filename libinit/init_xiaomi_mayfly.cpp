/*
 * Copyright (C) 2021-2022 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_dalvik_heap.h>
#include <libinit_variant.h>
#include <libinit_utils.h>

#include "vendor_init.h"

#define FINGERPRINT_CN "Xiaomi/mayfly/mayfly:14/UKQ1.231003.002/V816.0.5.0.ULTCNXM:user/release-keys"

static const variant_info_t mayfly_info = {
    .hwc_value = "CN",
    .sku_value = "",
    .brand = "Xiaomi",
    .device = "mayfly",
    .marketname = "Xiaomi 12S",
    .model = "2206123SC",
//  .mod_device = "mayfly",
    .mod_device = "mayfly", // Fixed miuicamera crash
    .build_fingerprint = FINGERPRINT_CN,
};

static const std::vector<variant_info_t> variants = {
    mayfly_info,
};

void vendor_load_properties() {
    set_dalvik_heap();
    search_variant(variants);

    // SafetyNet workaround
    property_override("ro.boot.verifiedbootstate", "green");
}
