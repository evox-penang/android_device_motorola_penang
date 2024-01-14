# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

TARGET_BOOT_ANIMATION_RES := 720
TARGET_SCREEN_DENSITY := 280

# A/B
AB_OTA_POSTINSTALL_CONFIG := \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

# Brightness
SOONG_CONFIG_qtidisplay_brightness := true

# Device characteristics
DEVICE_CHARACTERISTICS += hfr fm

# Device path
DEVICE_PATH := device/motorola/penang/rootdir

# Model
PRODUCT_MODEL := moto g53j 5G

# Modules
BOOT_KERNEL_MODULES := \
    tcpc_sgm7220.ko \
    tcpc_rt1711h.ko \
    rt_pd_manager.ko \
    focaltech_0flash_v2_mmi.ko \
    nova_0flash_mmi.ko

# NFC
TARGET_USES_PN5XX_PN8X_NFC := true

# Additional overlays
PRODUCT_PACKAGES += \
    penangRegulatoryInfoOverlay \
    penangEuiccOverlay

# SKU-specific overlays
PRODUCT_PACKAGES += \
    penangFrameworksOverlayYM \
    penangSettingsProviderOverlayYM \
    penangRegulatoryInfoOverlayYM \
    penangFrameworksOverlaySB \
    penangSettingsProviderOverlaySB

# GCamGo
PRODUCT_PACKAGES += \
    GCamGOPrebuilt-V4

# EvoX stuff
DEVICE_PACKAGE_OVERLAYS += device/motorola/penang/overlay-evolution

# Inherit from those products. Most specific first.
$(call inherit-product, device/motorola/sm4350-common/platform.mk)

# include board vendor blobs
$(call inherit-product-if-exists, vendor/motorola/penang/penang-vendor.mk)
