LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

include $(LOCAL_PATH)/../../../config.mk

INCLUDES := \
	$(LOCAL_PATH)/../include \
	$(LOCAL_PATH)/../../../pr/include

CSRCS =\
	plvrsion.c  \
	strlen.c  \
	strcpy.c  \
	strdup.c  \
	strcase.c \
	strcat.c  \
	strcmp.c  \
	strchr.c  \
	strpbrk.c \
	strstr.c  \
	strtok.c  \
	base64.c \
	plerror.c \
	plgetopt.c

LOCAL_C_INCLUDES := \
	$(INCLUDES)

LOCAL_SRC_FILES := \
	$(CSRCS)

OCAL_CFLAGS := $(DEFINES)
LOCAL_CFLAGS += \
	-D_PRODUCTION=\"libplc\"

LOCAL_SHARED_LIBRARIES := libnspr

LOCAL_MODULE := libplc

include $(BUILD_SHARED_LIBRARY)
