#
# Copyright 2017 The Android Open Source Project
# Copyright (C) 2026 OPLUS SM6375 TWRP
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

# Building with minimal manifest
DEVICE_PATH := device/oplus/holi
ALLOW_MISSING_DEPENDENCIES := true

#BUILD_BROKEN_DUP_RULES                          := true
#BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES    := true

BUILD_BROKEN_USES_BUILD_HOST_SHARED_LIBRARY := true
BUILD_BROKEN_USES_BUILD_HOST_STATIC_LIBRARY := true
BUILD_BROKEN_USES_BUILD_HOST_EXECUTABLE     := true
BUILD_BROKEN_USES_BUILD_COPY_HEADERS        := true

# Architecture
TARGET_ARCH                 := arm64
TARGET_ARCH_VARIANT         := armv8-a-branchprot
TARGET_CPU_ABI              := arm64-v8a
TARGET_CPU_VARIANT          := kryo385

TARGET_2ND_ARCH             := arm
TARGET_2ND_ARCH_VARIANT     := armv8-2a
TARGET_2ND_CPU_ABI          := armeabi-v7a
TARGET_2ND_CPU_ABI2         := armeabi
TARGET_2ND_CPU_VARIANT      := cortex-a75

# Bootloader
TARGET_NO_BOOTLOADER        := false
TARGET_USES_UEFI            := true
TARGET_USES_REMOTEPROC      := true

# A/B
AB_OTA_UPDATER := true
BOARD_USES_RECOVERY_AS_BOOT := true

AB_OTA_PARTITIONS := \
    boot \
    vendor_boot \
    dtbo \
    vbmeta \
    super \

# AB partitions for oplus
AB_OTA_PARTITIONS += \
    my_bigball \
    my_carrier \
    my_company \
    my_engineering \
    my_heytap \
    my_manifest \
    my_preload \
    my_product \
    my_region \
    my_stock

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME    := holi

# Kernel/Ramdisk
BOARD_BOOT_HEADER_VERSION   := 4
BOARD_MKBOOTIMG_ARGS        += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME     := kernel
BOARD_RAMDISK_USE_LZ4       := true
TARGET_HAS_GENERIC_KERNEL_HEADERS := true
TARGET_PREBUILT_KERNEL      := $(DEVICE_PATH)/prebuilt/$(BOARD_KERNEL_IMAGE_NAME)

# Partition Info
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

TARGET_COPY_OUT_ODM             := odm
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := erofs

TARGET_USERIMAGES_USE_EXT4  := true
TARGET_USERIMAGES_USE_F2FS  := true
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE      := erofs
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE    := f2fs
BOARD_BOOTIMAGE_PARTITION_SIZE          := 167772160
BOARD_KERNEL_GKI_BOOTIMAGE_PARTITION_SIZE := $(BOARD_BOOTIMAGE_PARTITION_SIZE)
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE   := 167772160
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE      := erofs

# Dynamic/Logical Partitions
BOARD_SUPER_PARTITION_SIZE              := 9126805504
BOARD_SUPER_PARTITION_GROUPS            := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE       := 9122611200
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor odm
#BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST += my_bigball my_carrier my_company my_engineering my_heytap my_manifest my_preload my_product my_region my_stock


# Workaround for error copying vendor files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor

# Platform
TARGET_BOARD_PLATFORM   := holi
QCOM_BOARD_PLATFORMS    += holi

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

TARGET_RECOVERY_DEVICE_MODULES += \
    android.hidl.allocator@1.0 \
    android.hidl.memory@1.0 \
    android.hidl.memory.token@1.0 \
    libdmabufheap \
    libhidlmemory \
    libion \
    libnetutils \
    vendor.display.config@1.0 \
    vendor.display.config@2.0 \
    libdebuggerd_client

RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.allocator@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.memory@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.memory.token@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdmabufheap.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libhidlmemory.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libnetutils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdebuggerd_client.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so


# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# File systems
TW_USE_DMCTL := true

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_RECOVERY_ALGORITHM    := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

#BOARD_AVB_VBMETA_SYSTEM := system
#BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
#BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
#BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
#BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 2

# Encryption
BOARD_USES_METADATA_PARTITION   := true
BOARD_USES_QCOM_FBE_DECRYPTION  := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_PREPARE_DATA_MEDIA_EARLY      := true

# Security patches
PLATFORM_VERSION                := 99.87.36
PLATFORM_VERSION_LAST_STABLE    := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH         := 2099-12-31
VENDOR_SECURITY_PATCH           := $(PLATFORM_SECURITY_PATCH)


# Recovery
TARGET_RECOVERY_PIXEL_FORMAT    := RGBX_8888
TARGET_RECOVERY_QCOM_RTC_FIX    := true

# TWRP display
TW_THEME                  := portrait_hdpi
TW_CUSTOM_CLOCK_POS       := 580
TW_SCREEN_BLANK_ON_BOOT  := true
TW_DEFAULT_LANGUAGE       := zh_CN

# TWRP extras
TW_CUSTOM_CPU_TEMP_PATH         := "/sys/class/thermal/thermal_zone34/temp"
TW_EXCLUDE_APEX                 := true
TW_EXCLUDE_DEFAULT_USB_INIT     := true
TW_EXTRA_LANGUAGES              := true
TW_INCLUDE_FASTBOOTD            := true
TW_INCLUDE_RESETPROP            := true
TW_INCLUDE_REPACKTOOLS          := true
TW_INCLUDE_7ZA                  := true
TW_INCLUDE_ZSTD                 := true
TW_NO_EXFAT_FUSE                := true
TW_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID := true
TW_NO_NETWORK                   := true
#TW_NO_SCREEN_BLANK             := true
TW_HAS_EDL_MODE                 := true
TW_BATTERY_SYSFS_WAIT_SECONDS   := 6

# TWRP file system
RECOVERY_SDCARD_ON_DATA     := true
TARGET_USES_MKE2FS          := true
TW_ENABLE_FS_COMPRESSION    := true
TW_INCLUDE_FUSE_EXFAT       := true
TW_INCLUDE_FUSE_NTFS        := true
TW_INCLUDE_NTFS_3G          := true
TW_ENABLE_ALL_PARTITION_TOOLS := true

# TWRP override props
#TW_OVERRIDE_SYSTEM_PROPS := \
    "ro.build.product;ro.build.fingerprint=ro.vendor.build.fingerprint;ro.build.version.incremental"
#TW_OVERRIDE_PROPS_ADDITIONAL_PARTITIONS := vendor


# Vendor modules to load in recovery
TW_LOAD_VENDOR_MODULES := "oplus_bsp_ir_core.ko oplus_bsp_kookong_ir_spi.ko oplus_bsp_midas.ko oplus_bsp_tp_comon.ko oplus_bsp_tp_custom.ko oplus_bsp_tp_focal_common.ko oplus_bsp_tp_ft3518.ko oplus_bsp_tp_ft3681.ko oplus_bsp_tp_goodix_comnon.ko oplus_bsp_tp_gt9886.ko oplus_bsp_tp_ilitek7807s.ko oplus_bsp_tp_ilitek_common.ko oplus_bsp_tp_notify.ko oplus_bsp_tp_novatek_common.ko oplus_bsp_tp_nt36523_noflash.ko oplus_bsp_tp_nt36672c_noflash.ko oplus_bsp_tp_syna_comnon.ko oplus_bsp_tp_tcm_S3910.ko oplus_bsp_tp_td4377_noflash.ko"
TW_LOAD_VENDOR_MODULES_EXCLUDE_GKI := true

# USB
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file"


# Version
TW_DEVICE_VERSION := OPLUS-SM6375


# TWRP Debug
TARGET_USES_LOGD        := true
TWRP_INCLUDE_LOGCAT     := true

# Soong namespaces
