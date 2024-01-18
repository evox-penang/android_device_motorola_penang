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

BUILD_BROKEN_DUP_RULES := true

# Platform
PRODUCT_PLATFORM := holi
include device/motorola/sm4350-common/PlatformConfig.mk

# Modules
BOARD_VENDOR_KERNEL_MODULES_LOAD := \
    tcpc_sgm7220.ko \
    tcpc_rt1711h.ko \
    wcd_core_dlkm.ko \
    wcd938x_dlkm.ko \
    q6_notifier_dlkm.ko \
    platform_dlkm.ko \
    stub_dlkm.ko \
    aw87xxx_dlkm.ko \
    wcd938x_slave_dlkm.ko \
    swr_ctrl_dlkm.ko \
    swr_dlkm.ko \
    wcd937x_dlkm.ko \
    camera.ko \
    aw882xx_acf.ko \
    q6_dlkm.ko \
    wsa881x_analog_dlkm.ko \
    q6_pdr_dlkm.ko \
    wcd9xxx_dlkm.ko \
    wcd937x_slave_dlkm.ko \
    mbhc_dlkm.ko \
    pinctrl_lpi_dlkm.ko \
    aw882xx_k419.ko \
    machine_dlkm.ko \
    rx_macro_dlkm.ko \
    va_macro_dlkm.ko \
    apr_dlkm.ko \
    bolero_cdc_dlkm.ko \
    tx_macro_dlkm.ko \
    snd_event_dlkm.ko \
    adsp_loader_dlkm.ko \
    nfc_i2c.ko \
    native_dlkm.ko \
    rmnet_core.ko \
    rmnet_ctl.ko \
    rmnet_offload.ko \
    rmnet_shs.ko \
    fpsensor_spi_tee.ko \
    fpc1020_mmi.ko \
    mmi_sys_temp.ko \
    rt_pd_manager.ko \
    nova_0flash_mmi.ko \
    focaltech_0flash_v2_mmi.ko

BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := \
    tcpc_sgm7220.ko \
    tcpc_rt1711h.ko \
    rt_pd_manager.ko \
    focaltech_0flash_v2_mmi.ko \
    nova_0flash_mmi.ko

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 90

# Init
TARGET_INIT_VENDOR_LIB := //device/motorola/penang:init_penang
TARGET_RECOVERY_DEVICE_MODULES := init_penang

# Partition information
BOARD_SUPER_PARTITION_SIZE := 4966055936
BOARD_SUPER_PARTITION_GROUPS := mot_dynamic_partitions
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := $(BOARD_BOOTIMAGE_PARTITION_SIZE)

## EROFS
BOARD_EROFS_PCLUSTER_SIZE := 262144
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs

# DYNAMIC_PARTITIONS_SIZE = (SUPER_PARTITION_SIZE / 2) - 4MB
BOARD_MOT_DYNAMIC_PARTITIONS_SIZE := 2478833664
BOARD_MOT_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system_ext \
    system \
    product \
    vendor

# SELinux
BOARD_SEPOLICY_DIRS += device/motorola/penang/sepolicy

# HIDL
DEVICE_MANIFEST_FILE += device/motorola/penang/manifest.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += device/motorola/penang/device_framework_matrix.xml
