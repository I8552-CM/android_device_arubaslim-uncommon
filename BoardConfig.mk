#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# inherit from the proprietary version

LOCAL_PATH := device/samsung/arubaslim

-include device/samsung/arubaslim/kernel/Android.mk

TARGET_SPECIFIC_HEADER_PATH := device/samsung/arubaslim/include

# cflags
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP -DQCOM_HARDWARE
COMMON_GLOBAL_CFLAGS += -DLPA_DEFAULT_BUFFER_SIZE=480
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a5 -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a5 -mfpu=neon-vfpv4 -mfloat-abi=softfp

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
# Try to use ASHMEM if possible (when non-MDP composition is used)
TARGET_GRALLOC_USES_ASHMEM := true

# Arch related defines and optimizations
TARGET_ARCH := arm
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a5
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_BOARD_PLATFORM := msm7x27a
TARGET_BOOTLOADER_BOARD_NAME := MSM8225
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_CORTEX_CACHE_LINE_32 := true
ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true

TARGET_CORTEX_CACHE_LINE_32 := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

TARGET_BOARD_PLATFORM_GPU := qcom-adreno203
BOARD_USES_ADRENO_200 := true
DISABLE_DEXPREOPT := true

# Kernel
TARGET_KERNEL_SOURCE := kernel/samsung/arubaslim
TARGET_KERNEL_CONFIG := arubaslim_defconfig
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00200000
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01300000
BOARD_KERNEL_PAGESIZE := 4096
#KERNEL_TOOLCHAIN_PREFIX := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-linux-gnueabi-linaro_4.7.4-2014.06/bin/arm-eabi-
#KERNEL_TOOLCHAIN_PREFIX := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.9/bin/arm-eabi-

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USES_UNCOMPRESSED_KERNEL := false
BOARD_WANTS_EMMC_BOOT := true

# Charger
BOARD_CHARGER_RES := device/samsung/arubaslim/charger
BOARD_BATTERY_DEVICE_NAME := "battery"
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_LPM_BOOT_ARGUMENT_NAME := androidboot.bootchg
BOARD_LPM_BOOT_ARGUMENT_VALUE := true

ARCH_ARM_HAVE_TLS_REGISTER := true
BOARD_EGL_CFG := device/samsung/arubaslim/config/egl.cfg

BOARD_CACHEIMAGE_PARTITION_SIZE := 41943040
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
TARGET_NO_RECOVERY := false
TARGET_USERIMAGES_USE_EXT4 := true

## Filesystem
BOARD_DATA_DEVICE := /dev/block/mmcblk0p24
BOARD_DATA_FILESYSTEM := ext4
BOARD_DATA_FILESYSTEM_OPTIONS := rw
BOARD_SYSTEM_DEVICE := /dev/block/mmcblk0p21
BOARD_SYSTEM_FILESYSTEM := ext4
BOARD_SYSTEM_FILESYSTEM_OPTIONS := rw
BOARD_CACHE_DEVICE := /dev/block/mmcblk0p22
BOARD_CACHE_FILESYSTEM := ext4
BOARD_CACHE_FILESYSTEM_OPTIONS := rw

## Partition sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 12582912
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12582912
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1258291200
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5573804032

# FM
BOARD_HAVE_QCOM_FM := true
COMMON_GLOBAL_CFLAGS += -DQCOM_FM_ENABLED

TARGET_PROVIDES_LIBLIGHT := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_CSR := true

# Dalvik
TARGET_ARCH_LOWMEM := true

# Hardware tunables framework
BOARD_HARDWARE_CLASS := device/samsung/arubaslim/cmhw/

# Display
TARGET_QCOM_DISPLAY_VARIANT := legacy
TARGET_QCOM_MEDIA_VARIANT := legacy
COMMON_GLOBAL_CFLAGS += -DQCOM_LEGACY_MMPARSE
TARGET_QCOM_AUDIO_VARIANT := caf
BOARD_USES_LEGACY_ALSA_AUDIO := true
COMMON_GLOBAL_CFLAGS += -DNO_TUNNEL_RECORDING
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true
TARGET_USES_ION := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
BOARD_USE_MHEAP_SCREENSHOT := true

## EGL, graphics
USE_OPENGL_RENDERER := true
TARGET_DOESNT_USE_FENCE_SYNC := true
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true

# Add QC Video Enhancements flag
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
TARGET_ENABLE_AV_ENHANCEMENTS := false

# SEPOLICY
BOARD_SEPOLICY_DIRS := \
       device/samsung/arubaslim/sepolicy

BOARD_SEPOLICY_UNION := \
       device.te \
       app.te \
       file_contexts

# EGL
BOARD_EGL_WORKAROUND_BUG_10194508 := true
BOARD_EGL_CFG := device/samsung/arubaslim/config/egl.cfg
HWUI_COMPILE_FOR_PERF := true

# Media
TARGET_QCOM_MEDIA_VARIANT := legacy
COMMON_GLOBAL_CFLAGS += -DLPA_DEFAULT_BUFFER_SIZE=480
TARGET_QCOM_LEGACY_MMPARSER := true
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK

# Samsung has weird framebuffer
TARGET_NO_INITLOGO := true

# FM Radio
BOARD_HAVE_QCOM_FM := true
COMMON_GLOBAL_CFLAGS += -DQCOM_FM_ENABLED

## Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 24

## UMS
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun%d/file"

# Override healthd HAL
BOARD_HAL_STATIC_LIBRARIES := libhealthd.msm7x27a

# GPS
QCOM_GPS_PATH := hardware/qcom/gps
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)

TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Camera
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT -DNEEDS_VECTORIMPL_SYMBOLS -DSAMSUNG_CAMERA_LEGACY
USE_DEVICE_SPECIFIC_CAMERA := true
USE_CAMERA_STUB :=false

# Webkit
#PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes
#TARGET_FORCE_CPU_UPLOAD := true

# RIL
BOARD_RIL_CLASS := ../../../device/samsung/arubaslim/ril/
COMMON_GLOBAL_CFLAGS += -DRIL_SUPPORTS_SEEK
COMMON_GLOBAL_CFLAGS += -DRIL_VARIANT_LEGACY

DEVICE_RESOLUTION := 480x800

# Wi-Fi
BOARD_WLAN_DEVICE := ath6kl
TARGET_CUSTOM_WIFI := ../../device/samsung/arubaslim/libhardware_legacy/wifi/wifi.c
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WIFI_DRIVER_IFACE_NAME := "wlan"
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_ath6kl
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_ath6kl
WIFI_EXT_MODULE_NAME := "cfg80211"
WIFI_EXT_MODULE_PATH := "/system/lib/modules/cfg80211.ko"
WIFI_DRIVER_MODULE_AP_ARG := "suspend_mode=3 wow_mode=2 ath6kl_p2p=1 recovery_enable=1"
WIFI_DRIVER_MODULE_NAME := "ath6kl_sdio"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/ath6kl_sdio.ko"
WIFI_DRIVER_MODULE_ARG := "suspend_mode=3 wow_mode=2 ath6kl_p2p=1 recovery_enable=1"
WIFI_DRIVER_FW_PATH_PARAM := "/data/misc/wifi/fwpath"

# Recovery # CWM
#BOARD_CUSTOM_GRAPHICS := ../../../device/samsung/arubaslim/recovery/graphics.c
TARGET_RECOVERY_FSTAB := device/samsung/arubaslim/rootdir/fstab.qcom
DEVICE_RESOLUTION := 4800x800 \
BOARD_USE_CUSTOM_RECOVERY_FONT := "<font_15x40.h>"
TARGET_BOOTLOADER_BOARD_NAME := msm7x27
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
BOARD_UMS_LUNFILE := /sys/class/android_usb/android0/f_mass_storage/lun%d/file
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_INITRC := device/samsung/arubaslim/recovery/init.rc
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/arubaslim/recovery/recovery-keys.c

