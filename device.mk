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
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=420

# Brightness
SOONG_CONFIG_qtidisplay_brightness := true

# Device path
DEVICE_PATH := device/motorola/milanf/rootdir

# Device Init
PRODUCT_PACKAGES += \
    fstab.qcom.vendor_ramdisk \
    fstab.qcom

# Fingerprint
TARGET_USES_EGISTEC_FINGERPRINT := true
TARGET_USES_SILEAD_FINGERPRINT := true

# Modules
BOOT_KERNEL_MODULES := \
    tcpc_sgm7220.ko \
    tcpc_rt1711h.ko \
    rt_pd_manager.ko

# NFC
TARGET_USES_PN5XX_PN8X_NFC := true

# Power
TARGET_IS_BLAIR := true

# Inherit from those products. Most specific first.
$(call inherit-product, device/motorola/sm4350-common/platform.mk)

# include board vendor blobs
$(call inherit-product-if-exists, vendor/motorola/milanf/milanf-vendor.mk)
