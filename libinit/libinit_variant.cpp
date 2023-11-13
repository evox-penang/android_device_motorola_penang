/*
 * Copyright (C) 2021 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <android-base/properties.h>
#include <libinit_utils.h>

#include <libinit_variant.h>

using android::base::GetProperty;

#define SKU_PROP "ro.boot.hardware.sku"

void search_variant(const std::vector<variant_info_t> variants) {
    std::string sku_value = GetProperty(SKU_PROP, "");

    for (const auto& variant : variants) {
        if ((variant.sku_value == "" || variant.sku_value == sku_value)) {
            set_variant_props(variant);
            break;
        }
    }
}

void set_variant_props(const variant_info_t variant) {
    set_ro_build_prop("model", variant.model, true);
    set_ro_build_prop("name", variant.name, true);

    set_ro_build_prop("fingerprint", variant.build_fingerprint);
    property_override("ro.bootimage.build.fingerprint", variant.build_fingerprint);

    property_override("ro.build.description", fingerprint_to_description(variant.build_fingerprint));
}
