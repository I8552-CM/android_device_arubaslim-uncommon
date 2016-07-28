# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Boot animation
TARGET_SCREEN_WIDTH := 480
TARGET_SCREEN_HEIGHT := 800

# Release name
PRODUCT_RELEASE_NAME := delos3geur
PRODUCT_NAME := cm_delos3geur

$(call inherit-product, device/samsung/delos3geur/full_delos3geur.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_BRAND=SAMSUNG \
    PRODUCT_NAME=delos3geur \
    BUILD_PRODUCT=delos3geur

