#
# Copyright (C) 2013 The CyanogenMod Project
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

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_small.mk)

LOCAL_PATH := device/samsung/arubaslim

DEVICE_PACKAGE_OVERLAYS := device/samsung/arubaslim/overlay

PRODUCT_LOCALES := ru_RU
PRODUCT_LOCALES += hdpi
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_TAGS += dalvik.gc.type-precise

# Config Files
PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/samsung/arubaslim/system,system)

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/samsung/arubaslim/rootdir,root)

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml  

# Wifi
PRODUCT_PACKAGES += \
    p2p_supplicant_overlay.conf \
    wpa_supplicant_overlay.conf

PRODUCT_PACKAGES += \
    libQWiFiSoftApCfg

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory 

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.msm7x27a \
    audio.usb.default \
    audio_policy.msm7x27a \
    libaudioutils

# Display
PRODUCT_PACKAGES += \
    libgenlock \
    gralloc.msm7x27a \
    copybit.msm7x27a \
    libqdMetaData \
    memtrack.msm7x27a \
    hwcomposer.msm7x27a

# Wal
PRODUCT_PACKAGES += \
    librs_jni \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    hwmac \
    resize2fs \
    setup_fs

# GPS
PRODUCT_PACKAGES += \
    gps.default \
    libgps.utils \
    libloc_adapter \
    libloc_eng \
    libloc_api-rpc-qc

# gps hal
PRODUCT_PACKAGES += \
    gps.msm7x27a


# light hal
PRODUCT_PACKAGES += \
    lights.msm7x27a

# Misc
PRODUCT_PACKAGES += \
    libcnefeatureconfig \
    libnl_2 

PRODUCT_PACKAGES += \
    libQWiFiSoftApCfg

# Color Convert
PRODUCT_PACKAGES += \
    libI420colorconvert \
    libc2dcolorconvert

# Omx
PRODUCT_PACKAGES += \
    libmm-omxcore \
    libOmxCore \
    libstagefrighthw \
    libdashplayer

# stagefright cmdline tools
PRODUCT_PACKAGES += \
    stagefright \
    record \
    recordvideo \
    audioloop \
    stream \
    sf2 \
    codec \
    muxer

# FM radio
PRODUCT_PACKAGES += \
    qcom.fmradio \
    libqcomfm_jni \
    FM2

# Bluetooth
PRODUCT_PACKAGES += \
    bluetooth-headers \
    hciconfig \
    hciattach \
    btmon \
    btproxy \
    bluetoothd-snoop \
    btmgmt \
    hcitool \
    l2ping \
    libsbc \
    avinfo \
    bccmd \
    haltest \
    libdbus \
    audio.sco.default \
    bluetoothd

# Webkit
PRODUCT_PACKAGES += \
    libwebcore

# Power Hal
PRODUCT_PACKAGES += \
    power.msm7x27a \
    power.qcom

# Product specific Packages
PRODUCT_PACKAGES += \
    SamsungServiceMode

# Enable Torch
PRODUCT_PACKAGES += Torch

# Misc
PRODUCT_PACKAGES += \
    charger_res_images \
    libcnefeatureconfig \
    libnl_2 \
    lights.msm7x27a

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    headset.hook.delay=500

PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true

PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type=dyn \
    debug.hwc.dynThreshold=1.9 \
    ro.bq.gpu_to_cpu_unsupported=1 \
    ro.max.fling_velocity=4000 \
    ro.opengles.version=131072 \
    ro.sf.lcd_density=160 \
    mm.enable.smoothstreaming=true \
    ro.sys.fw.bg_apps_limit=20 \
    debug.gr.numframebuffers=3 \
    ro.bq.gpu_to_cpu_unsupported=1
  
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapgrowthlimit=32m \
    dalvik.vm.heapsize=128m \
    ro.config.low_ram=true \
    persist.sys.strictmode.visual=false \
    ro.config.low_ram=true

PRODUCT_PROPERTY_OVERRIDES += \
   media.stagefright.enable-player=true \
   media.stagefright.enable-meta=false \
   media.stagefright.enable-scan=true \
   media.stagefright.enable-http=true \
   media.stagefright.enable-fma2dp=true \
   media.stagefright.enable-aac=true \
   media.stagefright.enable-qcp=true

PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true \
    dev.pm.dyn_sample_period=700000 \
    dev.pm.dyn_samplingrate=1 \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

PRODUCT_PROPERTY_OVERRIDES += \
    ril.subscription.types=NV,RUIM \
    rild.libargs=-d/dev/smd0 \
    ro.telephony.call_ring.delay=3000 \
    ro.telephony.call_ring.multiple=false \
    com.qc.hardware=true

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mass_storage,adb \
    ro.vold.umsdirtyratio=50 \
    lpa.decode = false

PRODUCT_PROPERTY_OVERRIDES += \
    persist.webview.provider=classic

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    ro.qualcomm.cabl=1 \
    wifi.supplicant_scan_interval=60
   
# Voip
PRODUCT_PROPERTY_OVERRIDES += \
    lpa.decode=false \
    tunnel.decode=false \
    lpa.use-stagefright=false \
    lpa.releaselock=false

PRODUCT_PROPERTY_OVERRIDES += \
   ro.fm.analogpath.supported=true \
   ro.fm.transmitter=false \
   ro.fm.mulinst.recording.support=false

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.secure=0

PRODUCT_PROPERTY_OVERRIDES += \
  ro.use_data_netmgrd=true \
  persist.data_netmgrd_nint=16 \
  persist.radio.apm_sim_not_pwdn=1  

PRODUCT_PROPERTY_OVERRIDES += \
	debug.sf.hw=1 \
	debug.enabletr=false \
	debug.composition.7x27A.type=gpu \
	debug.composition.8x25.type=gpu \
	debug.hwc.dynThreshold=1.91 \
	dev.pm.dyn_sample_period=700000 \
	ro.qc.sdk.camera.facialproc=false \
	ro.qc.sdk.gestures.camera=false \
	dalvik.vm.heaputilization=0.25 \
	dalvik.vm.heapidealfree=8388608 \
	dalvik.vm.heapconcurrentstart=2097152

$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)

## Misc files
PRODUCT_COPY_FILES += \
    device/samsung/arubaslim/system/lib/liboncrpc.so:obj/lib/liboncrpc.so \
    device/samsung/arubaslim/system/lib/libnv.so:obj/lib/libnv.so \
    device/samsung/arubaslim/system/lib/libaudcal.so:obj/lib/libaudcal.so \

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_MANUFACTURER := Samsung
PRODUCT_BRAND := Samsung
