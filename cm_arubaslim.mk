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

# Release name
PRODUCT_RELEASE_NAME := arubaslim

# Correct boot animation size for the screen
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 800

# Specify phone tech before including full_phone
#$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
#$(call inherit-product, device/samsung/kernel/kernel.mk)
# Inherit from d9 device
$(call inherit-product, device/samsung/arubaslim/arubaslim.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := cm_arubaslim
PRODUCT_DEVICE := arubaslim
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := SAMSUNG
PRODUCT_MODEL := GT-I8262

PRODUCT_GMS_CLIENTID_BASE := android-google
