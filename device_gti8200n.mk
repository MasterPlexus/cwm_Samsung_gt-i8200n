$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/gti8200n/gti8200n-vendor.mk)

# Enable higher-res drawables while keeping mdpi as primary source (used from T110)
PRODUCT_AAPT_CONFIG := large mdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_LOCALES += mdpi

DEVICE_PACKAGE_OVERLAYS += device/samsung/gti8200n/overlay

LOCAL_PATH := device/samsung/gti8200n
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

#create a directory in /system/
#    $(shell mkdir -p $(TARGET_OUT)out/target/product/gti8200n/recovery/root/lib/)
#    $(shell mkdir -p $(TARGET_OUT)out/target/product/gti8200n/recovery/root/lib/modules)
#copy stuff
#    $(shell cp $(LOCAL_PATH)/lib/modules/* `pwd`/$(TARGET_OUT)out/target/product/gti8200n/recovery/root/lib/modules)
#PRODUCT_COPY_FILES += \ $(LOCAL_PATH)/lib/*:recovery/root/lib/ 
#PRODUCT_COPY_FILES += \ $(LOCAL_PATH)/lib/modules/*:recovery/root/lib/modules/* 

# Init files (used from T110)
PRODUCT_PACKAGES += \
    fstab.pxa988 \
    init_charging.rc \
    ueventd.pxa988.rc \
    lpm.rc \
    init.recovery.pxa988.rc

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_gti8200n
PRODUCT_DEVICE := gti8200n
