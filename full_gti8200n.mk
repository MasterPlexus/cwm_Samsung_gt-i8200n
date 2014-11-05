## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := gti8200n

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/gti8200n/device_gti8200n.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := gti8200n
PRODUCT_NAME := cm_gti8200n
PRODUCT_BRAND := samsung
PRODUCT_MODEL := gti8200n
PRODUCT_MANUFACTURER := samsung
