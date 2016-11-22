LOCAL_PATH := $(call my-dir)

ifneq ($(USE_CAMERA_STUB),true)
ifneq ($(BUILD_TINY_ANDROID),true)
ifeq ($(USE_DEVICE_SPECIFIC_CAMERA),true)

include $(CLEAR_VARS)

# When zero we link against libmmcamera; when 1, we dlopen libmmcamera.
DLOPEN_LIBMMCAMERA := 1

LOCAL_CFLAGS:= -DDLOPEN_LIBMMCAMERA=$(DLOPEN_LIBMMCAMERA)

LOCAL_CFLAGS += -DUSE_ION

LOCAL_CFLAGS += -DCAMERA_ION_HEAP_ID=ION_CAMERA_HEAP_ID
LOCAL_CFLAGS += -DCAMERA_ZSL_ION_HEAP_ID=ION_CAMERA_HEAP_ID
LOCAL_CFLAGS += -DCAMERA_GRALLOC_HEAP_ID=GRALLOC_USAGE_PRIVATE_CAMERA_HEAP
LOCAL_CFLAGS += -DCAMERA_GRALLOC_FALLBACK_HEAP_ID=GRALLOC_USAGE_PRIVATE_SYSTEM_HEAP
LOCAL_CFLAGS += -DCAMERA_GRALLOC_CACHING_ID=GRALLOC_USAGE_PRIVATE_UNCACHED #uncached
LOCAL_CFLAGS += -DCAMERA_ION_FALLBACK_HEAP_ID=ION_CAMERA_HEAP_ID
LOCAL_CFLAGS += -DCAMERA_ZSL_ION_FALLBACK_HEAP_ID=ION_CAMERA_HEAP_ID

LOCAL_HAL_FILES := \
     QCameraHAL.cpp QCameraHWI_Parm.cpp\
     QCameraHWI.cpp QCameraHWI_Preview.cpp \
     QCameraHWI_Record_7x27A.cpp QCameraHWI_Still.cpp \
     QCameraHWI_Mem.cpp QCameraHWI_Display.cpp \
     QCameraStream.cpp QualcommCamera2.cpp QCameraHWI_Rdi.cpp QCameraParameters.cpp

LOCAL_CFLAGS+= -DHW_ENCODE

LOCAL_SRC_FILES := $(MM_CAM_FILES) $(LOCAL_HAL_FILES)

LOCAL_CFLAGS+= -DNUM_PREVIEW_BUFFERS=4 -D_ANDROID_

# Executed only on QCOM BSPs
ifeq ($(TARGET_USES_QCOM_BSP),true)
# This flag is used to compile out any features that depend on framework changes
    common_flags += -DQCOM_BSP
endif
  
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
LOCAL_C_INCLUDES += \
     $(call project-path-for,qcom-display)/libgralloc \
     $(call project-path-for,qcom-media)/libstagefrighthw \
     $(call project-path-for,qcom-media)/mm-core/inc \
     frameworks/base/services/camera/libcameraservice \
     frameworks/native/include/media/hardware \
     system/media/camera/include \
     $(LOCAL_PATH)/mm-camera-interface


LOCAL_SHARED_LIBRARIES := \
    libcamera_client \
    libcutils \
    liblog \
    libui \
    libutils \
    libhardware \
    libbinder \
    libmmcamera_interface2

LOCAL_CFLAGS += -include bionic/libc/include/sys/socket.h

ifeq ($(DLOPEN_LIBMMCAMERA),1)
    LOCAL_SHARED_LIBRARIES += libdl
    LOCAL_CFLAGS += -DDLOPEN_LIBMMCAMERA
else
    LOCAL_SHARED_LIBRARIES += liboemcamera
endif

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE := camera.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
endif # BUILD_TINY_ANDROID
endif # USE_CAMERA_STUB
endif # USE_DEVICE_SPECIFIC_CAMERA

include $(LOCAL_PATH)/mm-camera-interface/Android.mk
