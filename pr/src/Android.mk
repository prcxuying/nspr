LOCAL_PATH := $(call my-dir)

include $(LOCAL_PATH)/../../config.mk

ifeq ($(USE_PTHREADS), 1)
ifeq ($(OS_TARGET),Android)
# Android has no libpthread.so in NDK
OS_LIBS = -ldl
else
OS_LIBS = -lpthread -ldl
endif
else
OS_LIBS = -ldl
endif


ifneq ($(OS_TARGET),Android)
# Android has no librt - realtime functions are in libc
OS_LIBS += -lrt
else
OS_LIBS += -llog
endif

include $(CLEAR_VARS)

SRC_FILES := \
	prvrsion.c \
	io/prfdcach.c \
	io/prmwait.c \
	io/prmapopt.c \
	io/priometh.c \
	io/pripv6.c \
	io/prlayer.c \
	io/prlog.c \
	io/prmmap.c \
	io/prpolevt.c \
	io/prprf.c \
	io/prscanf.c \
	io/prstdio.c \
	threads/prcmon.c \
	threads/prrwlock.c \
	threads/prtpd.c \
	linking/prlink.c \
	malloc/prmalloc.c \
	malloc/prmem.c \
	md/prosdep.c \
	memory/prshm.c \
	memory/prshma.c \
	memory/prseg.c \
	misc/pralarm.c \
	misc/pratom.c \
	misc/prcountr.c \
	misc/prdtoa.c \
	misc/prenv.c \
	misc/prerr.c \
	misc/prerror.c \
	misc/prerrortable.c \
	misc/prinit.c \
	misc/prinrval.c \
	misc/pripc.c \
	misc/prlog2.c \
	misc/prlong.c \
	misc/prnetdb.c \
	misc/praton.c \
	misc/prolock.c \
	misc/prrng.c \
	misc/prsystem.c \
	misc/prthinfo.c \
	misc/prtpool.c \
	misc/prtrace.c \
	misc/prtime.c

ifdef USE_PTHREADS
SRC_FILES += \
	pthreads/ptsynch.c  \
	pthreads/ptio.c  \
	pthreads/ptthread.c  \
	pthreads/ptmisc.c
else
SRC_FILES += \
	io/prdir.c  \
	io/prfile.c  \
	io/prio.c  \
	io/prsocket.c  \
	misc/pripcsem.c

SRC_FILES += \
	threads/prcthr.c  \
	threads/prdump.c  \
	threads/prmon.c  \
	threads/prsem.c  \
	threads/combined/prucpu.c  \
	threads/combined/prucv.c  \
	threads/combined/prulock.c  \
	threads/combined/prustack.c  \
	threads/combined/pruthr.c
endif

md_CSRCS := \
	unix.c \
	unix_errors.c \
	uxproces.c \
	uxrng.c \
	uxshm.c \
	uxwrap.c
ifneq ($(USE_PTHREADS),1)
md_CSRCS += uxpoll.c
endif
md_CSRCS += linux.c

SRC_FILES += $(addprefix md/unix/,$(md_CSRCS))

LOCAL_SRC_FILES := \
	$(SRC_FILES)

LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/../include \
	$(LOCAL_PATH)/../include/md \
	$(LOCAL_PATH)/../include/obsolete \
	$(LOCAL_PATH)/../include/private

LOCAL_CFLAGS := $(DEFINES)
LOCAL_CFLAGS += \
	-D_PRODUCTION=\"libnspr\" \
	-D_NSPR_BUILD_

LOCAL_LDFLAGS := $(OS_LIBS)

LOCAL_MULTI_PREBUILTS := pr_include

LOCAL_MODULE := libnspr

include $(BUILD_SHARED_LIBRARY)
