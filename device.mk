# Inherit common device configuration
$(call inherit-product, device/samsung/sm8150-common/common.mk)

# Proprietary blobs
$(call inherit-product-if-exists, vendor/samsung/sm8150-common/sm8150-common-vendor.mk)

DEVICE_PATH := device/samsung/beyond2qlte

# Soong Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Resolution
TARGET_SCREEN_HEIGHT := 3200
TARGET_SCREEN_WIDTH := 1440
TARGET_BOOTANIMATION_HALF_RES := true

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay \
    $(DEVICE_PATH)/overlay-lineage

PRODUCT_AAPT_CONFIG := large xlarge
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Display
PRODUCT_PRODUCT_PROPERTIES += \
    ro.sf.lcd_density=560

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.samsung-sm8150

# Fingerprint Inscreen
PRODUCT_PACKAGES += \
	vendor.lineage.biometrics.fingerprint.inscreen@1.0-service.samsung-sm8150

PRODUCT_COPY_FILES += \
    vendor/lineage/config/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml:$(TARGET_OUT_PRODUCT)/vendor_overlay/$(PLATFORM_VNDK_VERSION)/etc/permissions/vendor.lineage.biometrics.fingerprint.inscreen.xml

# Init
PRODUCT_PACKAGES += \
	fstab.qcom

# Skip Mount
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/skip_mount.cfg:system/etc/init/config/skip_mount.cfg

# Lineage
ifneq ($(LINEAGE_BUILD),)
-include $(DEVICE_PATH)/device_lineage.mk
endif
