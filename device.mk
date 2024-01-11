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

TARGET_SCREEN_DENSITY := 280

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=$(TARGET_SCREEN_DENSITY)

# Brightness
SOONG_CONFIG_qtidisplay_brightness := true

# Device characteristics
DEVICE_CHARACTERISTICS += hfr

# Device path
DEVICE_PATH := device/motorola/penang/rootdir

# Fingerprint
TARGET_USES_CHIPONE_FINGERPRINT := true
TARGET_USES_FPC_FINGERPRINT := true

# Model
PRODUCT_MODEL := moto g53j 5G

# Modules
BOOT_KERNEL_MODULES := \
    sgm4154x_charger.ko \
    bq2589x_charger.ko \
    tcpc_sgm7220.ko \
    tcpc_rt1711h.ko \
    rt_pd_manager.ko \
    focaltech_0flash_v2_mmi.ko \
    nova_0flash_mmi.ko

# NFC
TARGET_USES_SN1XX_NFC := true

# Configstore
PRODUCT_PACKAGES += \
    vendor.qti.hardware.capabilityconfigstore@1.0.vendor

# Additional overlays
PRODUCT_PACKAGES += \
    penangRegulatoryInfoOverlay \
    penangEuiccOverlay

# The default value of this variable is false and should only be set to true when
# the device allows users to retain eSIM profiles after factory reset of user data.
PRODUCT_PRODUCT_PROPERTIES += \
    masterclear.allow_retain_esim_profiles_after_fdr=true

# Inherit from those products. Most specific first.
$(call inherit-product, device/motorola/sm4350-common/platform.mk)

# include board vendor blobs
$(call inherit-product-if-exists, vendor/motorola/penang/penang-vendor.mk)
