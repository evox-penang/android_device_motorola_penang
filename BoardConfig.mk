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

include device/motorola/sm4350-common/PlatformConfig.mk

# Kernel cmdline
BOARD_KERNEL_CMDLINE += \
    androidboot.hab.csv=5 \
    androidboot.hab.product=denver \
    androidboot.hab.cid=50

TARGET_BOOTLOADER_BOARD_NAME := denver

# Platform
PRODUCT_PLATFORM := holi

# Kernel DTB/DTBO
BOARD_PREBUILT_DTBIMAGE_DIR := device/motorola/osaka-kernel
BOARD_PREBUILT_DTBOIMAGE := device/motorola/osaka-kernel/dtbo.img

# Kernel Modules
BOARD_VENDOR_KERNEL_MODULES := \
    $(wildcard device/motorola/osaka-kernel/5.4/*.ko)

# Partition information
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_DTBOIMG_PARTITION_SIZE := 25165824 # (0x1800000)

BOARD_SUPER_PARTITION_SIZE := 13958643712
BOARD_SUPER_PARTITION_GROUPS := mot_dynamic_partitions
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := $(BOARD_BOOTIMAGE_PARTITION_SIZE)

# Set error limit to SUPER_PARTITION_SIZE - 500MiB
BOARD_SUPER_PARTITION_ERROR_LIMIT := 13446643712

# DYNAMIC_PARTITIONS_SIZE = (SUPER_PARTITION_SIZE / 2) - 4MB
BOARD_MOT_DYNAMIC_PARTITIONS_SIZE := 6169821184
BOARD_MOT_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system_ext \
    system \
    product \
    vendor

# Slightly overprovision dynamic partitions with 50MiB to
# allow on-device file editing
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 52428800
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 52428800
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := 52428800
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 52428800

# Reserve space for data encryption (239541551104-16384)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 239541534720
