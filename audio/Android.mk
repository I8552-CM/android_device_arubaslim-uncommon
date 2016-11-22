AUDIO_HAL_PATH := $(call my-dir)

ifeq ($(strip $(BOARD_USES_LEGACY_ALSA_AUDIO)),true)
    include $(AUDIO_HAL_PATH)/audio_hal/Android.mk
    include $(AUDIO_HAL_PATH)/policy_hal/Android.mk
endif
 
