# =========================================================
#                       MAKEFILE TEST
# ---------------------------------------------------------
# @brief :    Test different options in GNU Makefile
# @author:    qinhj@lsec.cc.ac.cn
# @version:   v0.0.1 2020/02/25
# =========================================================

# compiler
CC  := $(CROSS_TOOL)gcc
CXX := $(CROSS_TOOL)g++
AR  := $(CROSS_TOOL)ar
LD  := $(CROSS_TOOL)ld
STRIP := $(CROSS_TOOL)strip

# user config:
CFLAG   += --sysroot=$(SYSROOT) -fmessage-length=0
CPPFLAG += --sysroot=$(SYSROOT) -fmessage-length=0
CFLAG   += #-O0 -g3 -W -D _DEBUG #-D _GNU_SOURCE -fvisibility=hidden
CPPFLAG += #-O0 -g3 -W -D _DEBUG #-D _GNU_SOURCE -fvisibility=hidden

# include settings
inc     := #-I./inc
extinc  += #-I./extinc
INCFLAG := $(inc) $(extinc)

# library settings
lib     := #-L./lib
extlib  +=
LIBPATH := $(lib) $(extlib)
# Note: To link libdl.so, one need add -D _GNU_SOURCE to CFLAG.
LIBLINK := #-ldl

# ========================================================================================

# compile flag
LIBFLAG := $(CFLAG) -shared -fPIC
LDFLAG  := $(LIBPATH) -rdynamic -Wl,--as-needed $(LIBLINK)

# runtime rpath dir
RPATH_DIR ?= .#:$(SYSROOT)/usr/lib

# targets: lib/bin/sample
LIBRARY := libfunc.so
BINARY  := demo
TARGETS := $(LIBRARY) $(BINARY)

# source code files
SRC_DIRS := . #./src
SRC_FILE := $(foreach dir, $(SRC_DIRS), $(wildcard $(dir)/*.c))
SRC_OBJS := $(patsubst %.c, %.o, $(SRC_FILE))

# ========================================================================================

default: all

# ------------------
bin: $(BINARY)
# ------------------
demo: $(SRC_OBJS)
	$(CC) -o $@ $^ $(CFLAG) $(LDFLAG) #-Wl,-rpath,$(RPATH_DIR)

all: info
	make bin
	make _clean

_clean:
	@for subdir in $(SRC_DIRS); do \
		(cd $$subdir && rm -rf *.o *~ *.d) \
	done;

clean: _clean
	rm -f $(TARGETS)

info:
	@echo "============================================================================="
	@echo "ROOT_DIR: $(ROOT_DIR)"
	@echo "COMPILER: $(CC)/$(CXX)"
	@echo "SYSROOT:  $(SYSROOT)"
	@echo "STAGING:  $(STAGING)"
	@echo "DESTDIR:  $(DESTDIR)"
	@echo "============================================================================="

install: info
	@echo "============================================================================="
	@echo "Not support install yet!"
	@echo "============================================================================="

test:
	@echo "[TEST: ] ============================================================================="
	#### test '@' ####
	echo  "[TEST:@] One can see the runtime command in output console without '@'."
	@echo "[TEST:@] However, with '@', one won't see the runtime command in output console. One can only see the output result."
	@echo "[TEST: ] -----------------------------------------------------------------------------"
	#### test '#' ####
	## test comment with indent: tab('\t')
    ## test comment with indent: blank("    ")  <-- add at least one ':' to enable highlight again
	@echo "[TEST:#] As you can see, Makefile can only print comment to output console with indent as tab."
	@echo "[TEST:#] Although blank indent won't cause error, but it'll disable the highlight in Makefile."
	@echo "[TEST:#] However, one can enable highlight in Makefile again by adding at least one ':' in comment."
	@echo "[TEST: ] -----------------------------------------------------------------------------"
	#### test '-' ####
	-@rm unexist.file
	@echo "[TEST:-] With '-', Makefile will ignore all !0 return state and continue running."
	@echo "[TEST: ] "-@" is better than "@-", since it won't disable highlight in Makefile with gedit."
	#### test '+' ####
	+@echo  "[TEST:+] Currently, I've no idea about '+'. Maybe for silent warning about make -jN."
	@echo "[TEST: ] ============================================================================="

.NOTPARALLEL: clean demo
.PHONY: clean info install test

# ========================================================================================

%.o: %.c
	$(CC) $(INCFLAG) -fPIC -O2 $(CFLAG) -o $@ -c $<

%.o: %.cpp
	$(CXX) $(INCFLAG) -fPIC -O2 $(CPPFLAG) -o $@ -c $<
