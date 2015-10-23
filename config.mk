####################################################################
#
# The NSPR-specific configuration
#
####################################################################

NSPR_CONFIG_MK = 1
USE_PTHREADS = 1
CROSS_COMPILE = 1
MOZ_OPTIMIZE = 1

DEFINES := \
	-DNDEBUG=1 \
	-DHAVE_VISIBILITY_HIDDEN_ATTRIBUTE=1 \
	-DHAVE_VISIBILITY_PRAGMA=1 \
	-DXP_UNIX=1 \
	-D_GNU_SOURCE=1 \
	-DHAVE_FCNTL_FILE_LOCKING=1 \
	-DLINUX=1 \
	-DHAVE_DLADDR=1 \
	-DHAVE_LCHOWN=1 \
	-DHAVE_SETPRIORITY=1 \
	-DHAVE_STRERROR=1 \
	-DHAVE_SYSCALL=1 \
	-D_REENTRANT=1 \
	-DFORCE_PR_LOG

ifeq ($(_PR_NO_CLOCK_TIMER),1)
DEFINES += -D_PR_NO_CLOCK_TIMER
endif

ifeq ($(USE_PTHREADS), 1)
DEFINES += -D_PR_PTHREADS -UHAVE_CVAR_BUILT_ON_SEM
endif

ifeq ($(PTHREADS_USER), 1)
DEFINES += -DPTHREADS_USER -UHAVE_CVAR_BUILT_ON_SEM
endif

ifeq ($(USE_IPV6),1)
DEFINES += -D_PR_INET6
endif

ifeq ($(MOZ_UNICODE),1)
DEFINES += -DMOZ_UNICODE
endif
