#
# Copyright (C) 2020 The PixelExperience Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/begonia

BUILD_BROKEN_DUP_RULES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a76

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Audio
USE_CUSTOM_AUDIO_POLICY := 1

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# Display
TARGET_SCREEN_DENSITY := 440

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := begonia
TARGET_NO_BOOTLOADER := true

# Broken rules
BUILD_BROKEN_USES_BUILD_COPY_HEADERS := true

# Platform
TARGET_BOARD_PLATFORM := mt6785
TARGET_BOARD_PLATFORM_GPU := mali-g76mc4

# Kernel
include device/xiaomi/begonia-kernel/BoardConfigKernel.mk

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml

# MTK Rules
TARGET_PROVIDES_MTK_PROPRIETARY := true
TARGET_PROVIDES_MEDIATEK_IMS_STACK := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3758096384
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 120116445184
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 452984832
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_DTBOIMG_PARTITION_SIZE := 33554432
BOARD_VENDORIMAGE_PARTITION_SIZE := 1610612736
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_SYSTEM_EXT := system/system_ext
TARGET_COPY_OUT_PRODUCT := system/product
TARGET_COPY_OUT_VENDOR := vendor

TARGET_USERIMAGES_USE_EXT4 := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.mt6785
TARGET_RECOVERY_UI_BLANK_UNBLANK_ON_INIT := true

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Security patch level
VENDOR_SECURITY_PATCH := 2021-02-01

# Sepolicy
include device/mediatek/sepolicy_vndr/SEPolicy.mk

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/private
BOARD_PLAT_PUBLIC_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/public
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# VNDK
BOARD_VNDK_RUNTIME_DISABLE := true
PRODUCT_VENDOR_MOVE_ENABLED := true

# Inherit from the proprietary version
-include vendor/xiaomi/begonia/BoardConfigVendor.mk
