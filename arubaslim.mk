#
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
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, vendor/samsung/arubaslim/arubaslim-vendor-blobs.mk)
# The GPS configuration appropriate for this device.
#$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/arubaslim/overlay

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_TAGS += dalvik.gc.type-precise

# ViewMem 
PRODUCT_PACKAGES += viewmem

# Rootdir
PRODUCT_COPY_FILES += device/samsung/arubaslim/rootdir/lpm.rc:root/lpm.rc
PRODUCT_COPY_FILES += device/samsung/arubaslim/rootdir/init.qcom.bt.rc:root/init.qcom.bt.rc
PRODUCT_COPY_FILES += device/samsung/arubaslim/rootdir/init.device.rc:root/init.device.rc
PRODUCT_COPY_FILES += device/samsung/arubaslim/rootdir/fstab.qcom:root/fstab.qcom
PRODUCT_COPY_FILES += device/samsung/arubaslim/rootdir/init.qcom.rc:root/init.qcom.rc
PRODUCT_COPY_FILES += device/samsung/arubaslim/rootdir/init.qcom.ril.sh:root/init.qcom.ril.sh
PRODUCT_COPY_FILES += device/samsung/arubaslim/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc
PRODUCT_COPY_FILES += device/samsung/arubaslim/rootdir/charger:root/charger
PRODUCT_COPY_FILES += device/samsung/arubaslim/rootdir/init.qcom.usb.rc:root/init.qcom.usb.rc

#errors
PRODUCT_COPY_FILES += vendor/samsung/arubaslim/proprietary/lib/libaudioalsa.so:obj/lib/libaudioalsa.so
PRODUCT_COPY_FILES += vendor/samsung/arubaslim/proprietary/lib/libaudcal.so:obj/lib/libaudcal.so
PRODUCT_COPY_FILES += vendor/samsung/arubaslim/proprietary/lib/libaudcal.so:obj/lib/libaudcal.so
# Torch
PRODUCT_PACKAGES += Torch

# Packages
PRODUCT_PACKAGES += audio.a2dp.default
PRODUCT_PACKAGES += audio.primary.msm7x27a
PRODUCT_PACKAGES += audio_policy.msm7x27a
PRODUCT_PACKAGES += audio.usb.default
PRODUCT_PACKAGES += libaudioutils

PRODUCT_PACKAGES += libgenlock
PRODUCT_PACKAGES += copybit.msm7x27a
PRODUCT_PACKAGES += gralloc.msm7x27a
PRODUCT_PACKAGES += libqdMetaData
PRODUCT_PACKAGES += memtrack.msm7x27a
PRODUCT_PACKAGES += hwcomposer.msm7x27a
PRODUCT_PACKAGES += libtilerenderer

PRODUCT_PACKAGES += librs_jni
PRODUCT_PACKAGES += LiveWallpapers
PRODUCT_PACKAGES += LiveWallpapersPicker
PRODUCT_PACKAGES += VisualizationWallpapers

PRODUCT_PACKAGES += libmm-omxcore
PRODUCT_PACKAGES += libOmxCore
PRODUCT_PACKAGES += libstagefrighthw

PRODUCT_PACKAGES += gps.msm7x27a
PRODUCT_PACKAGES += camera.msm7x27a 
PRODUCT_PACKAGES += Camera2
PRODUCT_PACKAGES += lights.msm7x27a
#PRODUCT_PACKAGES += libhealthd.msm7x27a

# Bluetooth
PRODUCT_PACKAGES += bluetooth-headers 
PRODUCT_PACKAGES += hciconfig 
PRODUCT_PACKAGES += btmon 
PRODUCT_PACKAGES += btproxy 
PRODUCT_PACKAGES += bluetoothd-snoop 
PRODUCT_PACKAGES += btmgmt 
PRODUCT_PACKAGES += hciattach
PRODUCT_PACKAGES += hcitool 
PRODUCT_PACKAGES += l2ping 
PRODUCT_PACKAGES += libsbc 
PRODUCT_PACKAGES += avinfo 
PRODUCT_PACKAGES += haltest 
PRODUCT_PACKAGES += libdbus 
PRODUCT_PACKAGES += audio.sco.default 
PRODUCT_PACKAGES += bluetoothd

PRODUCT_PACKAGES += power.msm7x27a
PRODUCT_PACKAGES += power.qcom
PRODUCT_PACKAGES += charger_res_images 

PRODUCT_PACKAGES += com.android.future.usb.accessory
PRODUCT_PACKAGES += hwmac
PRODUCT_PACKAGES += make_ext4fs
PRODUCT_PACKAGES += setup_fs

# EGL
PRODUCT_PACKAGES += libstlport

# WIFI
PRODUCT_PACKAGES += libcnefeatureconfig
PRODUCT_PACKAGES += libwpa_client
PRODUCT_PACKAGES += hostapd
PRODUCT_PACKAGES += dhcpcd.conf
PRODUCT_PACKAGES += wpa_supplicant
PRODUCT_PACKAGES += wpa_supplicant.conf
#audio
PRODUCT_COPY_FILES += frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml
PRODUCT_COPY_FILES += frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml
PRODUCT_COPY_FILES += frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml
PRODUCT_COPY_FILES += device/samsung/arubaslim/configs/media_codecs.xml:system/etc/media_codecs.xml
PRODUCT_COPY_FILES += device/samsung/arubaslim/configs/AudioFilter.csv:system/etc/AudioFilter.csv
PRODUCT_COPY_FILES += device/samsung/arubaslim/configs/audio_policy.conf:system/etc/audio_policy.conf
PRODUCT_COPY_FILES += device/samsung/arubaslim/configs/media_profiles.xml:system/etc/media_profiles.xml
# Permissions
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml
PRODUCT_COPY_FILES += frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml
#PRODUCT_COPY_FILES += packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml
PRODUCT_PACKAGES += frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml
PRODUCT_PACKAGES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

#$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
