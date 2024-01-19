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
TARGET_USES_SN1XX_NFC := true
PRODUCT_PACKAGES += NQNfcNci

PRODUCT_PRODUCT_PROPERTIES += \
    persist.nfc_cfg.config_file_name=libnfc-nci_SN100.conf

include device/qcom/common/vendor/nfc/qti-nfc.mk

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_de/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.ese.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml

# Hardware-specific overlays
PRODUCT_PACKAGES += \
    penangEuiccOverlay \
    penangNfcOverlay

# SKU-specific overlays
PRODUCT_PACKAGES += \
    penangFrameworksOverlayYM \
    penangSettingsProviderOverlayYM \
    penangRegulatoryInfoOverlayYM \
    penangFrameworksOverlaySB \
    penangSettingsProviderOverlaySB

# Perf
PRODUCT_COPY_FILES += \
    system/core/libprocessgroup/profiles/task_profiles.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json \
    system/core/libprocessgroup/profiles/cgroups.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json

# GCamGo
PRODUCT_PACKAGES += \
    GCamGOPrebuilt-V4

# EvoX stuff
DEVICE_PACKAGE_OVERLAYS += device/motorola/penang/overlay-evolution

# Inherit from those products. Most specific first.
$(call inherit-product, device/motorola/sm4350-common/platform.mk)

# include board vendor blobs
$(call inherit-product-if-exists, vendor/motorola/penang/penang-vendor.mk)
