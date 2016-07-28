LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE       := wpa_supplicant.conf
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES    := config/$(LOCAL_MODULE)
LOCAL_MODULE_PATH  := $(TARGET_OUT_ETC)/wifi
include $(BUILD_PREBUILT)
