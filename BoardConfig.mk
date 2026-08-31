#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/qualcomm/holi

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# A/B
AB_OTA_UPDATER := true
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
BOARD_USES_RECOVERY_AS_BOOT := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := holi

# Kernel
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := kernel

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
endif

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 167772160
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := qualcomm_dynamic_partitions
BOARD_QUALCOMM_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor odm
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST += my_bigball my_carrier my_company my_engineering my_heytap my_manifest my_preload my_product my_region my_stock
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9122611200

# Platform
TARGET_BOARD_PLATFORM := holi

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

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

TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery.fstab

# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_CUSTOM_CLOCK_POS        := 580
TW_DEFAULT_LANGUAGE        := zh_CN
TW_CUSTOM_CPU_TEMP_PATH    := "/sys/class/thermal/thermal_zone34/temp"
TW_EXCLUDE_TWRPAPP         := true
TW_EXTRA_LANGUAGES         := true
TW_HAS_EDL_MODE            := true
TW_INPUT_BLACKLIST         := "hbtp_vm"
TW_INCLUDE_MTP             := true
TW_INCLUDE_FASTBOOTD       := true
TW_INCLUDE_REPACKTOOLS     := true
TW_SCREEN_BLANK_ON_BOOT    := true
TW_USE_TOOLBOX             := true
TARGET_RECOVERY_QCOM_RTC_FIX := true

# TWRP file system
TARGET_USES_MKE2FS          := true
TW_INCLUDE_FUSE_EXFAT       := true
TW_INCLUDE_FUSE_NTFS        := true
TW_INCLUDE_NTFS_3G          := true
TW_ENABLE_ALL_PARTITION_TOOLS := true

# Tools
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_LPDUMP := true
TW_INCLUDE_LPTOOLS := true

# USB
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file"

# Crypto
BOARD_USES_QCOM_FBE_DECRYPTION  := true
TW_PREPARE_DATA_MEDIA_EARLY     := true
BOARD_USES_METADATA_PARTITION   := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_USE_FSCRYPT_POLICY           := 2

# Debug
TWRP_EVENT_LOGGING:= true
