LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

include $(LOCAL_PATH)/../../config.mk

INCLUDES := \
	$(LOCAL_PATH)/../../pr/include

CSRCS := \
	plarena.c \
	plhash.c \
	plvrsion.c

LOCAL_C_INCLUDES := \
	$(INCLUDES)

LOCAL_SRC_FILES := \
	$(CSRCS)

LOCAL_CFLAGS := $(DEFINES)
LOCAL_CFLAGS += \
	-D_PRODUCTION=\"libplds\"

LOCAL_SHARED_LIBRARIES := libnspr

LOCAL_MODULE := libplds

include $(BUILD_SHARED_LIBRARY)
