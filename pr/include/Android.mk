LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

SH_DATE := $(shell date "+%Y-%m-%d %T")

$(shell echo '#define _BUILD_STRING "$(SH_DATE)"' > $(LOCAL_PATH)/_pl_bld.h)
$(shell cp $(LOCAL_PATH)/md/_linux.cfg $(LOCAL_PATH)/prcpucfg.h)

LOCAL_MODULE := pr_include

EXPORT_PATH := usr/include/nspr

LOCAL_SRC_FILES := \
	prcpucfg.h:$(EXPORT_PATH)/prcpucfg.h \
	_pl_bld.h:$(EXPORT_PATH)/_pl_bld.h

include $(BUILD_MULTI_PREBUILT)
