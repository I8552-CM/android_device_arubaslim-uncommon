# Inherit some common CM stuff.
$(call inherit-product, vendor/carbon/config/common_phone.mk)

# Boot animation
TARGET_SCREEN_WIDTH := 480
TARGET_SCREEN_HEIGHT := 800

# Release name
PRODUCT_RELEASE_NAME := arubaslim
PRODUCT_NAME := carbon_arubaslim

$(call inherit-product, device/samsung/arubaslim/full_arubaslim.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_BRAND=SAMSUNG \
    BUILD_PRODUCT=arubaslim

