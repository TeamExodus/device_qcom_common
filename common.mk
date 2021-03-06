ifneq ($(TARGET_USES_AOSP),true)
TARGET_USES_QCOM_BSP := true
endif

TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_HAS_QC_KERNEL_SOURCE := true
TARGET_USES_QCOM_MM_AUDIO := true

BOARD_USES_ADRENO := true

# QCOM SECCOMP media permissions
BOARD_SECCOMP_POLICY += device/qcom/common/seccomp

# include additional build utilities
include device/qcom/common/utils.mk

ifneq ($(HOST_OS),linux)
$(warning ****************************************************************)
$(warning * SDCLANG is not supported on non-linux hosts. Disabling...)
$(warning ****************************************************************)
else
# include definitions for SDCLANG
include device/qcom/common/sdclang/sdclang.mk
endif

# Qualcomm specific packages
PRODUCT_PACKAGES += SnapdragonCamera

TARGET_CRYPTFS_HW_PATH := device/qcom/common/cryptfs_hw

# SECCOMP Extension
BOARD_SECCOMP_POLICY += device/qcom/common/seccomp

# Advanced DPM
ifeq ($(TARGET_WANTS_EXTENDED_DPM_PLATFORM),true)
PRODUCT_BOOT_JARS += tcmclient
PRODUCT_BOOT_JARS += com.qti.dpmframework
PRODUCT_BOOT_JARS += dpmapi
PRODUCT_BOOT_JARS += com.qti.location.sdk
endif

# Block Dash by default
TARGET_DISABLE_DASH ?= true

# Dash extension
ifeq ($(TARGET_DISABLE_DASH),false)
PRODUCT_BOOT_JARS += qcmediaplayer
endif

