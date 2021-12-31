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

# Device path
DEVICE_PATH := device/motorola/osaka/rootdir

DEVICE_PACKAGE_OVERLAYS += \
    device/motorola/osaka/overlay

# Device Specific Permissions
PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml

# Kernel
PRODUCT_COPY_FILES += \
    device/motorola/osaka-kernel/Image:kernel

# Audio Configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/vendor/etc/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(DEVICE_PATH)/vendor/etc/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_io_policy.conf

# Device Init
PRODUCT_PACKAGES += \
    fstab.osaka \
    vendor-fstab.osaka \
    init.recovery.qcom.rc

# Telephony Packages (AOSP)
PRODUCT_PACKAGES += \
    InCallUI \
    Stk

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=420

# Inherit from those products. Most specific first.
$(call inherit-product, device/motorola/sm4350-common/platform.mk)

# include board vendor blobs
$(call inherit-product-if-exists, vendor/motorola/osaka/osaka-vendor.mk)
