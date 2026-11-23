$(call inherit-product-if-exists, axion_sdk/ax_tflite/common.mk)

PRODUCT_PACKAGES += \
    AxThemePicker \
    AxQuickLook \
    AxionWidgets \
    AxionParts \
    AxThemeStore \
    AxPcMode \
    AxSandbox \
    EdgeLauncher \
    GameSpace \
    OmniJaws \
    ColumbusService \
    AxDiagnostics \
    ax_ram_plus_setup

TARGET_INCLUDE_AXFX ?= false
ifeq ($(TARGET_INCLUDE_AXFX),true)
$(call inherit-product-if-exists, packages/apps/AxionFx/config.mk)
endif

$(call inherit-product-if-exists, packages/apps/FaceUnlock/common.mk)

# Net-merge lives in Settings. These overlays only add its Quick Settings tile
# and, when the product opts in, make it the always-on VPN.
TARGET_NETMERGE_QS_TILE ?= true
ifeq ($(TARGET_NETMERGE_QS_TILE),true)
PRODUCT_PACKAGES += \
    NetMergeQsTileOverlay
endif

TARGET_NETMERGE_ALWAYS_ON ?= false
ifeq ($(TARGET_NETMERGE_ALWAYS_ON),true)
PRODUCT_PACKAGES += \
    NetMergeAlwaysOnOverlay
endif
